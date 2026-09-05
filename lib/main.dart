import 'package:flutter/material.dart';
import 'app/app.dart';

void main() {
  runApp(const BatnaDeliveryApp());
}
class CreateDeliveryScreen extends StatelessWidget {
  const CreateDeliveryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Delivery'),
        backgroundColor: const Color(0xFF006837),
        foregroundColor: Colors.white,
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const Text(
              'Where are you sending?',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            const Text(
              'Enter your pickup and drop-off locations.',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 14,
              ),
            ),

            const SizedBox(height: 30),

            // Pickup
            TextField(
              decoration: InputDecoration(
                labelText: 'Pickup location',
                prefixIcon: const Icon(
                  Icons.location_on_outlined,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Drop-off
            TextField(
              decoration: InputDecoration(
                labelText: 'Drop-off location',
                prefixIcon: const Icon(
                  Icons.location_on,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),

            const SizedBox(height: 30),

            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                onPressed: () {
                  // Next step
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF006837),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                child: const Text(
                  'Continue',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}