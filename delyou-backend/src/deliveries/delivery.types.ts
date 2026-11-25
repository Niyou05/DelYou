export type DeliveryStatus = 'pending' | 'assigned' | 'picked_up' | 'delivered' | 'cancelled';

export interface DeliveryEvent {
  id: string;
  status: DeliveryStatus;
  note: string | null;
  createdAt: string;
}

export interface Delivery {
  id: string;
  pickupAddress: string;
  deliveryAddress: string;
  recipientName: string;
  recipientPhone: string;
  packageDescription: string;
  notes: string | null;
  status: DeliveryStatus;
  createdAt: string;
  packageSize?: string | null;
  weight?: string | null;
  vehicle?: string | null;
  price?: string | null;
  deliveryTime?: string | null;
  customerId?: string | null;
  courierId?: string | null;
  events?: DeliveryEvent[];
}
