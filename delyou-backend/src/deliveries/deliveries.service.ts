import { BadRequestException, Injectable, NotFoundException } from '@nestjs/common';
import { randomUUID } from 'node:crypto';
import { PrismaService } from '../prisma/prisma.service';
import { CreateDeliveryDto } from './dto/create-delivery.dto';
import { Delivery, DeliveryStatus } from './delivery.types';
import { DeliveryStatus as PrismaDeliveryStatus } from '../generated/prisma/enums';

const requiredFields: (keyof CreateDeliveryDto)[] = [
  'pickupAddress',
  'deliveryAddress',
  'recipientName',
  'recipientPhone',
  'packageDescription',
];

const statusMap: Record<PrismaDeliveryStatus, DeliveryStatus> = {
  PENDING: 'pending',
  ASSIGNED: 'assigned',
  PICKED_UP: 'picked_up',
  DELIVERED: 'delivered',
  CANCELLED: 'cancelled',
};

const reverseStatusMap: Record<DeliveryStatus, PrismaDeliveryStatus> = {
  pending: 'PENDING',
  assigned: 'ASSIGNED',
  picked_up: 'PICKED_UP',
  delivered: 'DELIVERED',
  cancelled: 'CANCELLED',
};

@Injectable()
export class DeliveriesService {
  constructor(private readonly prisma: PrismaService) {}

  async create(input: CreateDeliveryDto, customerId?: string): Promise<Delivery> {
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

    const delivery = await this.prisma.delivery.create({
      data: {
        id: randomUUID(),
        customerId: customerId || null,
        pickupAddress: input.pickupAddress.trim(),
        deliveryAddress: input.deliveryAddress.trim(),
        recipientName: input.recipientName.trim(),
        recipientPhone: input.recipientPhone.trim(),
        packageDescription: input.packageDescription.trim(),
        packageSize: input.packageSize?.trim() || null,
        weight: input.weight?.trim() || null,
        vehicle: input.vehicle?.trim() || null,
        price: input.price?.trim() || null,
        notes: input.notes?.trim() || null,
        deliveryTime: input.deliveryTime?.trim() || null,
        status: 'PENDING',
        events: {
          create: {
            status: 'PENDING',
            note: 'Delivery created',
          },
        },
      },
      include: { events: true },
    });

    return this.toDelivery(delivery);
  }

  async find(id: string): Promise<Delivery> {
    return this.findOne(id);
  }

  async get(id: string): Promise<Delivery> {
    return this.findOne(id);
  }

  async list(): Promise<Delivery[]> {
    return this.findAll();
  }

  async getAll(): Promise<Delivery[]> {
    return this.findAll();
  }

  async findAll(): Promise<Delivery[]> {
    const deliveries = await this.prisma.delivery.findMany({
      orderBy: { createdAt: 'desc' },
      include: { events: { orderBy: { createdAt: 'asc' } } },
    });
    return deliveries.map((d) => this.toDelivery(d));
  }

  async findOne(id: string): Promise<Delivery> {
    const delivery = await this.prisma.delivery.findUnique({
      where: { id },
      include: { events: { orderBy: { createdAt: 'asc' } } },
    });
    if (!delivery) throw new NotFoundException(`Delivery ${id} was not found`);
    return this.toDelivery(delivery);
  }

  async updateStatus(id: string, status: DeliveryStatus, note?: string): Promise<Delivery> {
    if (!['pending', 'assigned', 'picked_up', 'delivered', 'cancelled'].includes(status)) {
      throw new BadRequestException('status is invalid');
    }
    const delivery = await this.prisma.delivery.findUnique({ where: { id } });
    if (!delivery) throw new NotFoundException(`Delivery ${id} was not found`);

    const current = statusMap[delivery.status];
    if (current === 'delivered' || current === 'cancelled') {
      throw new BadRequestException(`Cannot update a ${current} delivery`);
    }

    const updated = await this.prisma.delivery.update({
      where: { id },
      data: {
        status: reverseStatusMap[status],
        events: {
          create: {
            status: reverseStatusMap[status],
            note: note || `Status changed to ${status}`,
          },
        },
      },
      include: { events: { orderBy: { createdAt: 'asc' } } },
    });
    return this.toDelivery(updated);
  }

  async assignCourier(id: string, courierId: string): Promise<Delivery> {
    if (typeof courierId !== 'string' || !courierId.trim()) {
      throw new BadRequestException('courierId is required');
    }
    const courier = await this.prisma.user.findUnique({ where: { id: courierId } });
    if (!courier) throw new NotFoundException(`Courier ${courierId} was not found`);
    if (courier.role !== 'COURIER' && courier.role !== 'ADMIN') {
      throw new BadRequestException('user is not a courier');
    }

    const delivery = await this.prisma.delivery.findUnique({ where: { id } });
    if (!delivery) throw new NotFoundException(`Delivery ${id} was not found`);

    const updated = await this.prisma.delivery.update({
      where: { id },
      data: {
        courierId,
        status: 'ASSIGNED',
        events: {
          create: {
            status: 'ASSIGNED',
            note: `Assigned to courier ${courier.name || courier.email}`,
          },
        },
      },
      include: { events: { orderBy: { createdAt: 'asc' } } },
    });
    return this.toDelivery(updated);
  }

  async cancel(id: string, note?: string): Promise<Delivery> {
    return this.updateStatus(id, 'cancelled', note || 'Delivery cancelled');
  }

  async delete(id: string): Promise<{ success: boolean }> {
    return this.remove(id);
  }

  async remove(id: string): Promise<{ success: boolean }> {
    const delivery = await this.prisma.delivery.findUnique({ where: { id } });
    if (!delivery) throw new NotFoundException(`Delivery ${id} was not found`);
    await this.prisma.delivery.delete({ where: { id } });
    return { success: true };
  }

  private toDelivery(delivery: any): Delivery {
    return {
      id: delivery.id,
      pickupAddress: delivery.pickupAddress,
      deliveryAddress: delivery.deliveryAddress,
      recipientName: delivery.recipientName,
      recipientPhone: delivery.recipientPhone,
      packageDescription: delivery.packageDescription,
      notes: delivery.notes,
      status: statusMap[delivery.status as PrismaDeliveryStatus],
      createdAt: delivery.createdAt instanceof Date ? delivery.createdAt.toISOString() : delivery.createdAt,
      // extended fields stored for clients that need them
      ...(delivery.packageSize ? { packageSize: delivery.packageSize } : {}),
      ...(delivery.weight ? { weight: delivery.weight } : {}),
      ...(delivery.vehicle ? { vehicle: delivery.vehicle } : {}),
      ...(delivery.price ? { price: delivery.price } : {}),
      ...(delivery.deliveryTime ? { deliveryTime: delivery.deliveryTime } : {}),
      ...(delivery.customerId ? { customerId: delivery.customerId } : {}),
      ...(delivery.courierId ? { courierId: delivery.courierId } : {}),
      ...(delivery.events ? { events: delivery.events.map((e: any) => ({ id: e.id, status: statusMap[e.status as PrismaDeliveryStatus], note: e.note, createdAt: e.createdAt instanceof Date ? e.createdAt.toISOString() : e.createdAt })) } : {}),
    } as Delivery;
  }
}
