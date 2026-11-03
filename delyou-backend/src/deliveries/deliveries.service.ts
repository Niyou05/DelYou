import { BadRequestException, Injectable, NotFoundException } from '@nestjs/common';
import { randomUUID } from 'node:crypto';
import { CreateDeliveryDto } from './dto/create-delivery.dto';
import { Delivery } from './delivery.types';

const requiredFields: (keyof CreateDeliveryDto)[] = [
  'pickupAddress',
  'deliveryAddress',
  'recipientName',
  'recipientPhone',
  'packageDescription',
];

@Injectable()
export class DeliveriesService {
  // Temporary for this first milestone; we will replace this Map with database persistence.
  private readonly deliveries = new Map<string, Delivery>();

  create(input: CreateDeliveryDto): Delivery {
    if (!input || typeof input !== 'object') {
      throw new BadRequestException('Request body must be a JSON object');
    }
    for (const field of requiredFields) {
      if (typeof input[field] !== 'string' || !input[field].trim()) {
        throw new BadRequestException(`${field} is required`);
      }
    }
    if (input.notes !== undefined && typeof input.notes !== 'string') {
      throw new BadRequestException('notes must be a string');
    }

    const delivery: Delivery = {
      id: randomUUID(),
      pickupAddress: input.pickupAddress.trim(),
      deliveryAddress: input.deliveryAddress.trim(),
      recipientName: input.recipientName.trim(),
      recipientPhone: input.recipientPhone.trim(),
      packageDescription: input.packageDescription.trim(),
      notes: input.notes?.trim() || null,
      status: 'pending',
      createdAt: new Date().toISOString(),
    };
    this.deliveries.set(delivery.id, delivery);
    return delivery;
  }

  findOne(id: string): Delivery {
    const delivery = this.deliveries.get(id);
    if (!delivery) throw new NotFoundException(`Delivery ${id} was not found`);
    return delivery;
  }
}
