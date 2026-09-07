import 'package:flutter/material.dart';


class ReviewDeliveryscreen extends StatelessWidget {

final String? pickupLocation;
final String? destinationLocation;
final String vehicle;
final String vehiclePrice;
final String packageDescription;
final String packageSize;
final String weight;
final String instructions;
final String recipientName;
final String recipientPhone;
final String deliveryTime;

const ReviewDeliveryscreen ({
super.key,

required this.pickupLocation,
required this.destinationLocation,
required this.vehicle,
required this.vehiclePrice,
required this.packageDescription,
required this.packageSize,
required this.weight,
required this.instructions,
required this.recipientName,
required this.recipientPhone,
required this.deliveryTime,


});

@override
  Widget build(BuildContext context) {
 return Scaffold(
appBar: AppBar(
title: const Text(
'Review details',
style: TextStyle(
  fontWeight: FontWeight.bold,
),
),
),

body: SingleChildScrollView(
padding: const EdgeInsets.all(20),

child: Column(
children: [
const Text(
  'Review your Delivery',
  style: TextStyle(
   fontSize: 15,
   fontWeight: FontWeight.bold, 
  ),
),

const SizedBox(height: 8),

const Text(
'please Check your Details Before Confirming!!',
style: TextStyle(
  fontSize: 15,
  fontWeight: FontWeight.bold,
),
),

const SizedBox(height: 20),

_InfoCard(
title: 'Location',
icon: (Icons.location_on_outlined),
children: [
_InfoRow(
    label:'pickup',
    value: pickupLocation ?? 'Not Selected',
   ),
const SizedBox(height: 12),

_InfoRow(
    label: 'Destination',
    value: destinationLocation ?? 'Not Selected',
),
],
),


const SizedBox(height: 25),


_InfoCard(
title: 'Vehicle',
icon: (Icons.directions_car_outlined),
children: [
_InfoRow(
    label:'Vehicle',
    value: vehicle,
   ),
_InfoRow(
  label: 'Estimated Price',
  value: vehiclePrice,
),
],
),


const SizedBox(height: 15),


_InfoCard(
title: 'package',
icon: (Icons.inventory_2_outlined),
children: [
_InfoRow(
label: 'Description',
value: packageDescription,
),

const SizedBox(height: 12),


_InfoRow(
label:'Size',
value: packageSize,
),

const SizedBox(height:20),

_InfoRow(
label: 'weight',
value: weight.isEmpty ? 'Not Specified' : '$weight kg',
),
],
),

const SizedBox(height: 15),

            _InfoCard(
              title: 'Recipient',
              icon: Icons.person_outline,
              children: [
                _InfoRow(
                  label: 'Name',
                  value: recipientName,
                ),
                const SizedBox(height: 12),
                _InfoRow(
                  label: 'Phone',
                  value: recipientPhone,
                ),
              ],
            ),

            const SizedBox(height: 15),

            _InfoCard(
              title: 'Delivery time',
              icon: Icons.schedule_outlined,
              children: [
                _InfoRow(
                  label: 'Time',
                  value: deliveryTime,
                ),
              ],
            ),



 if (instructions.isNotEmpty) ...[
              const SizedBox(height: 15),

              _InfoCard(
                title: 'Additional instructions',
                icon: Icons.notes_outlined,
                children: [
                  Text(
                    instructions,
                    style: const TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ],

            const SizedBox(height: 25),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),

              decoration: BoxDecoration(
                color: const Color(0xFF0B7A4B),
                borderRadius: BorderRadius.circular(18),
              ),

              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [
                  const Text(
                    'Estimated price',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),

                  Text(
                    vehiclePrice,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              height: 55,

              child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        'Delivery confirmed successfully!',
                      ),
                    ),
                  );
                },

                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF0B7A4B),
                  foregroundColor: Colors.white,

                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),

                child: const Text(
                  'Confirm Delivery',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class _InfoCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final List<Widget> children;

  const _InfoCard({
    required this.title,
    required this.icon,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: Colors.grey.shade200,
        ),
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Row(
            children: [
              Icon(
                icon,
                color: const Color(0xFF0B7A4B),
              ),

              const SizedBox(width: 10),

              Text(
                title,
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        
          const SizedBox(height: 16),

          

          ...children,
        ],
      ),
    );
  }
}
class _InfoRow extends StatelessWidget {
  final String label;
  final String value;

  const _InfoRow({
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 105,
          child: Text(
            label,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 14,
            ),
          ),
        ),

        const SizedBox(width: 10),

        Expanded(
          child: Text(
            value,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}

