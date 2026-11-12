
import 'package:flutter/material.dart';

class CustomerTrackingScreen extends StatefulWidget {
  const CustomerTrackingScreen({super.key});

  @override
  State<CustomerTrackingScreen> createState() =>
      _CustomerTrackingScreenState();
}

class _CustomerTrackingScreenState
    extends State<CustomerTrackingScreen> {

  final Color primaryOrange = const Color(0xFFFF9800);
  final Color lightOrange = const Color(0xFFFFF3E0);
  final Color darkOrange = const Color(0xFFE65100);

  // Temporary delivery status
  int currentStep = 3;

  final List<String> deliverySteps = [
    'Order confirmed',
    'Courier assigned',
    'Package picked up',
    'On the way',
    'Delivered',
  ];

  final List<IconData> stepIcons = [
    Icons.check_circle_outline,
    Icons.person_outline,
    Icons.inventory_2_outlined,
    Icons.delivery_dining,
    Icons.home_outlined,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF8F0),

      appBar: AppBar(
        backgroundColor: primaryOrange,
        foregroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Track Delivery',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildMapPlaceholder(),
            _buildDeliveryInfo(),
            _buildProgressTimeline(),
            _buildCourierCard(),
          ],
        ),
      ),
    );
  }

  // MAP PLACEHOLDER
  Widget _buildMapPlaceholder() {
    return Container(
      height: 260,
      width: double.infinity,
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: lightOrange,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.map_outlined,
            size: 65,
            color: darkOrange,
          ),
          const SizedBox(height: 12),
          const Text(
            'Live Delivery Map',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 5),
          const Text(
            'Courier location will appear here',
            style: TextStyle(color: Colors.black54),
          ),
        ],
      ),
    );
  }

  // DELIVERY INFORMATION
  Widget _buildDeliveryInfo() {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Your delivery',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 7,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFF3E0),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  'In transit',
                  style: TextStyle(
                    color: darkOrange,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 18),

          Text(
            '15 min',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: darkOrange,
            ),
          ),

          const Text(
            'Estimated arrival time',
            style: TextStyle(color: Colors.black54),
          ),

          const SizedBox(height: 18),

          const Divider(),

          _buildAddressRow(
            Icons.radio_button_checked,
            'Pickup location',
            'Your pickup address',
          ),

          const SizedBox(height: 16),

          _buildAddressRow(
            Icons.location_on,
            'Destination',
            'Your destination address',
          ),
        ],
      ),
    );
  }

  Widget _buildAddressRow(
    IconData icon,
    String title,
    String address,
  ) {
    return Row(
      children: [
        Icon(icon, color: darkOrange),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: Colors.black54,
                  fontSize: 12,
                ),
              ),
              Text(
                address,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // DELIVERY TIMELINE
  Widget _buildProgressTimeline() {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Delivery progress',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 20),

          ...List.generate(deliverySteps.length, (index) {
            final bool completed = index <= currentStep;

            return Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Row(
                children: [
                  Icon(
                    stepIcons[index],
                    color: completed
                        ? darkOrange
                        : Colors.grey.shade400,
                    size: 25,
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: Text(
                      deliverySteps[index],
                      style: TextStyle(
                        fontWeight: completed
                            ? FontWeight.bold
                            : FontWeight.normal,
                        color: completed
                            ? Colors.black87
                            : Colors.grey,
                      ),
                    ),
                  ),
                  if (completed)
                    Icon(
                      Icons.check_circle,
                      color: darkOrange,
                      size: 20,
                    ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }

  // COURIER INFORMATION
  Widget _buildCourierCard() {
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 0, 16, 25),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 28,
            backgroundColor: lightOrange,
            child: Icon(
              Icons.person,
              color: darkOrange,
              size: 32,
            ),
          ),

          const SizedBox(width: 14),

          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Your courier',
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 12,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'Courier name',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Text(
                  'Motorcycle · DelYou',
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),

          IconButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Contact feature coming soon!'),
                ),
              );
            },
            icon: Icon(
              Icons.phone,
              color: darkOrange,
            ),
          ),
        ],
      ),
    );
  }
}
