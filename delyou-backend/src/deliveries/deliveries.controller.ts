import { Body, Controller, Delete, Get, Param, Patch, Post } from '@nestjs/common';
import type { CreateDeliveryDto } from './dto/create-delivery.dto';
import { DeliveriesService } from './deliveries.service';
import { DeliveryStatus } from './delivery.types';

@Controller('deliveries')
export class DeliveriesController {
  constructor(private readonly deliveriesService: DeliveriesService) {}

  @Post()
  create(@Body() body: CreateDeliveryDto) {
    return this.deliveriesService.create(body);
  }

  @Get()
  findAll() {
    return this.deliveriesService.findAll();
  }

  @Get(':id')
  findOne(@Param('id') id: string) {
    return this.deliveriesService.findOne(id);
  }

  @Patch(':id/status')
  updateStatus(@Param('id') id: string, @Body() body: { status: DeliveryStatus; note?: string }) {
    return this.deliveriesService.updateStatus(id, body.status, body?.note);
  }

  @Patch(':id/assign')
  assign(@Param('id') id: string, @Body() body: { courierId: string }) {
    return this.deliveriesService.assignCourier(id, body.courierId);
  }

  @Patch(':id/cancel')
  cancel(@Param('id') id: string, @Body() body?: { note?: string }) {
    return this.deliveriesService.cancel(id, body?.note);
  }

  @Delete(':id')
  remove(@Param('id') id: string) {
    return this.deliveriesService.remove(id);
  }
}
