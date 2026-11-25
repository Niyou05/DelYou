import { BadRequestException, Injectable, UnauthorizedException } from '@nestjs/common';
import { PrismaService } from '../prisma/prisma.service';
import { hashPassword, verifyPassword, generateToken, hashToken } from '../common/password.util';
import { Role } from '../generated/prisma/enums';

const SESSION_TTL_MS = 1000 * 60 * 60 * 24 * 7;

@Injectable()
export class AuthService {
  constructor(private readonly prisma: PrismaService) {}

  async register(input: any) {
    if (!input || typeof input !== 'object') {
      throw new BadRequestException('Request body must be a JSON object');
    }
    const { email, password, name, phone, role } = input;
    if (typeof email !== 'string' || !email.trim()) throw new BadRequestException('email is required');
    if (typeof password !== 'string' || password.length < 6) {
      throw new BadRequestException('password must be at least 6 characters');
    }
    const existing = await this.prisma.user.findUnique({ where: { email: email.trim().toLowerCase() } });
    if (existing) throw new BadRequestException('email already in use');

    const user = await this.prisma.user.create({
      data: {
        email: email.trim().toLowerCase(),
        password: hashPassword(password),
        name: typeof name === 'string' ? name.trim() : null,
        phone: typeof phone === 'string' ? phone.trim() : null,
        role: role === 'COURIER' || role === 'ADMIN' ? (role as Role) : Role.CUSTOMER,
      },
    });
    const token = await this.createSession(user.id);
    return { user: this.sanitizeUser(user), token };
  }

  async login(input: any) {
    if (!input || typeof input !== 'object') throw new BadRequestException('Request body must be a JSON object');
    const { email, password } = input;
    if (typeof email !== 'string' || typeof password !== 'string') {
      throw new BadRequestException('email and password are required');
    }
    const user = await this.prisma.user.findUnique({ where: { email: email.trim().toLowerCase() } });
    if (!user || !verifyPassword(password, user.password)) {
      throw new UnauthorizedException('invalid credentials');
    }
    const token = await this.createSession(user.id);
    return { user: this.sanitizeUser(user), token };
  }

  async validateToken(token: string) {
    if (!token) return null;
    const session = await this.prisma.session.findUnique({ where: { tokenHash: hashToken(token) } });
    if (!session || session.expiresAt < new Date()) {
      if (session) await this.prisma.session.delete({ where: { id: session.id } }).catch(() => undefined);
      return null;
    }
    const user = await this.prisma.user.findUnique({ where: { id: session.userId } });
    if (!user) return null;
    return this.sanitizeUser(user);
  }

  async logout(token: string) {
    if (!token) return { success: true };
    await this.prisma.session.deleteMany({ where: { tokenHash: hashToken(token) } });
    return { success: true };
  }

  private async createSession(userId: string) {
    const token = generateToken();
    await this.prisma.session.create({
      data: {
        userId,
        tokenHash: hashToken(token),
        expiresAt: new Date(Date.now() + SESSION_TTL_MS),
      },
    });
    return token;
  }

  private sanitizeUser(user: any) {
    const { password, ...rest } = user;
    return rest;
  }
}
