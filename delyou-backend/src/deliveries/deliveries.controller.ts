import { Body, Controller, Get, Param, Post } from '@nestjs/common';
import type { CreateDeliveryDto } from './dto/create-delivery.dto';
import { DeliveriesService } from './deliveries.service';

@Controller('deliveries')
export class DeliveriesController {
  constructor(private readonly deliveriesService: DeliveriesService) {}

  @Post()
  create(@Body() body: CreateDeliveryDto) {
    return this.deliveriesService.create(body);
  }

  @Get(':id')
  findOne(@Param('id') id: string) {
    return this.deliveriesService.findOne(id);
  }
}
