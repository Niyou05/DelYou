import { BadRequestException, Injectable, NotFoundException } from '@nestjs/common';
import { PrismaService } from '../prisma/prisma.service';
import { hashPassword } from '../common/password.util';

@Injectable()
export class UsersService {
  constructor(private readonly prisma: PrismaService) {}

  async getUsers() {
    const users = await this.prisma.user.findMany({
      orderBy: { createdAt: 'desc' },
      select: { id: true, email: true, name: true, phone: true, role: true, createdAt: true, updatedAt: true },
    });
    return { users };
  }

  async create(input: any) {
    if (!input || typeof input !== 'object') {
      throw new BadRequestException('Request body must be a JSON object');
    }
    const { email, password, name, phone, role } = input;
    if (typeof email !== 'string' || !email.trim()) throw new BadRequestException('email is required');
    const existing = await this.prisma.user.findUnique({ where: { email: email.trim().toLowerCase() } });
    if (existing) throw new BadRequestException('email already in use');

    const user = await this.prisma.user.create({
      data: {
        email: email.trim().toLowerCase(),
        password: typeof password === 'string' && password.length >= 6 ? hashPassword(password) : '',
        name: typeof name === 'string' ? name.trim() : null,
        phone: typeof phone === 'string' ? phone.trim() : null,
        role: role === 'COURIER' || role === 'ADMIN' ? role : 'CUSTOMER',
      },
      select: { id: true, email: true, name: true, phone: true, role: true, createdAt: true, updatedAt: true },
    });
    return user;
  }

  async findOne(id: string) {
    const user = await this.prisma.user.findUnique({
      where: { id },
      select: { id: true, email: true, name: true, phone: true, role: true, createdAt: true, updatedAt: true },
    });
    if (!user) throw new NotFoundException(`User ${id} was not found`);
    return user;
  }
}
