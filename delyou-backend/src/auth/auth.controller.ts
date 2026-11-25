import { Body, Controller, Get, Headers, Post } from '@nestjs/common';
import { AuthService } from './auth.service';

@Controller('auth')
export class AuthController {
  constructor(private readonly authService: AuthService) {}

  @Post('register')
  register(@Body() body: any) {
    return this.authService.register(body);
  }

  @Post('login')
  login(@Body() body: any) {
    return this.authService.login(body);
  }

  @Get('me')
  async me(@Headers('authorization') authorization?: string) {
    const token = (authorization || '').replace(/^Bearer\s+/i, '').trim();
    const user = await this.authService.validateToken(token);
    if (!user) throw new (require('@nestjs/common').UnauthorizedException)('unauthorized');
    return user;
  }

  @Post('logout')
  async logout(@Headers('authorization') authorization?: string) {
    const token = (authorization || '').replace(/^Bearer\s+/i, '').trim();
    return this.authService.logout(token);
  }
}
