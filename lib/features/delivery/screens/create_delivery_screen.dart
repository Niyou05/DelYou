
import 'package:flutter/material.dart';
import 'location_picker_screen.dart';
class CreateDeliveryScreen extends StatefulWidget {
  const CreateDeliveryScreen({super.key});

  @override
  State<CreateDeliveryScreen> createState() => _CreateDeliveryScreenState();
}

class _CreateDeliveryScreenState extends State<CreateDeliveryScreen> {
  int selectedVehicle = 0;

  String? pickupLocation;
  String? destinationLocation;

  final List<Map<String, dynamic>> vehicles = [
    {
      'name': 'Motorcycle',
      'icon': Icons.two_wheeler,
      'price': '250 DA',
    },
    {
      'name': 'Car',
      'icon': Icons.directions_car,
      'price': '400 DA',
    },
    {
      'name': 'Van',
      'icon': Icons.local_shipping,
      'price': '600 DA',
    },
  ];

  Future<void> _selectPickup() async {
    final result = await Navigator.push<String>(
      context,
      MaterialPageRoute(
        builder: (context) => const LocationPickerScreen(
          title: 'Pickup Location',
        ),
      ),
    );

    if (result != null) {
      setState(() {
        pickupLocation = result;
      });
    }
  }

  Future<void> _selectDestination() async {
    final result = await Navigator.push<String>(
      context,
      MaterialPageRoute(
        builder: (context) => const LocationPickerScreen(
          title: 'Destination',
        ),
      ),
    );

    if (result != null) {
      setState(() {
        destinationLocation = result;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Create Delivery',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Where are we going?',
              style: TextStyle(
                fontSize: 27,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            const Text(
              'Choose pickup and destination locations.',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 14,
              ),
            ),

            const SizedBox(height: 28),

            _LocationField(
              icon: Icons.my_location,
              iconColor: const Color(0xFF0B7A4B),
              title: 'Pickup location',
              hint: pickupLocation ?? 'Where should we pick up?',
              onTap: _selectPickup,
            ),

            const SizedBox(height: 16),

            _LocationField(
              icon: Icons.location_on,
              iconColor: Colors.red,
              title: 'Destination',
              hint: destinationLocation ?? 'Where should we deliver?',
              onTap: _selectDestination,
            ),

            const SizedBox(height: 30),

            const Text(
              'Choose vehicle',
              style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 15),

            SizedBox(
              height: 130,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: vehicles.length,
                itemBuilder: (context, index) {
                  final vehicle = vehicles[index];
                  final isSelected = selectedVehicle == index;

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedVehicle = index;
                      });
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      width: 120,
                      margin: const EdgeInsets.only(right: 12),
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? const Color(0xFF0B7A4B)
                            : Colors.white,
                        borderRadius: BorderRadius.circular(18),
                        border: Border.all(
                          color: isSelected
                              ? const Color(0xFF0B7A4B)
                              : Colors.grey.shade200,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            vehicle['icon'],
                            size: 32,
                            color: isSelected
                                ? Colors.white
                                : const Color(0xFF0B7A4B),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            vehicle['name'],
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: isSelected
                                  ? Colors.white
                                  : Colors.black87,
                            ),
                          ),
                          const SizedBox(height: 3),
                          Text(
                            vehicle['price'],
                            style: TextStyle(
                              fontSize: 12,
                              color: isSelected
                                  ? Colors.white70
                                  : Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 30),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Estimated price',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    '250 DA',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Final price may change depending on distance.',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF0B7A4B),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: const Text(
                  'Continue',
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

class _LocationField extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String title;
  final String hint;
  final VoidCallback onTap;

  const _LocationField({
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.hint,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: Colors.grey.shade200,
          ),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: iconColor,
              size: 28,
            ),

            const SizedBox(width: 14),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 13,
                      color: Colors.grey,
                    ),
                  ),

                  const SizedBox(height: 4),

                  Text(
                    hint,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),

            const Icon(
              Icons.chevron_right,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}

