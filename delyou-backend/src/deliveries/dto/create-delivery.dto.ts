export interface CreateDeliveryDto {
  pickupAddress: string;
  deliveryAddress: string;
  recipientName: string;
  recipientPhone: string;
  packageDescription: string;
  notes?: string;
  packageSize?: string;
  weight?: string;
  vehicle?: string;
  price?: string;
  deliveryTime?: string;
  customerId?: string;
}
