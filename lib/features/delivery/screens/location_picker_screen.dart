import 'package:flutter/material.dart';

class LocationPickerScreen extends StatefulWidget {
  final String title;

  const LocationPickerScreen({
    super.key,
    required this.title,
  });

  @override
  State<LocationPickerScreen> createState() => _LocationPickerScreenState();
}

class _LocationPickerScreenState extends State<LocationPickerScreen> {
  final TextEditingController _controller = TextEditingController();

  static const Color primaryGreen = Color(0xFF006837);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _confirmLocation() {
    final location = _controller.text.trim();

    if (location.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter a location'),
        ),
      );
      return;
    }

    Navigator.pop(context, location);
  }

  void _useCurrentLocation() {
    _controller.text = 'Current Location';

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Current location will be available with GPS.'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F9F8),

      appBar: AppBar(
        backgroundColor: const Color(0xFFF7F9F8),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black87,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          widget.title,
          style: const TextStyle(
            color: Colors.black87,
            fontSize: 19,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              const SizedBox(height: 10),

              const Text(
                'Choose a location',
                style: TextStyle(
                  fontSize: 27,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF123C2A),
                ),
              ),

              const SizedBox(height: 8),

              const Text(
                'Select the location for your delivery.',
                style: TextStyle(
                  fontSize: 15,
                  color: Color(0xFF68736F),
                ),
              ),

              const SizedBox(height: 24),

              // Search / location field
              TextField(
                controller: _controller,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(
                  hintText: 'Search location...',
                  hintStyle: const TextStyle(
                    color: Colors.grey,
                  ),
                  prefixIcon: const Icon(
                    Icons.search,
                    color: primaryGreen,
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 17,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide.none,
                  ),
                ),
                onSubmitted: (_) => _confirmLocation(),
              ),

              const SizedBox(height: 18),

              // Map placeholder
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(22),
                  ),
                  child: const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        Icon(
                          Icons.map_outlined,
                          size: 70,
                          color: Colors.grey,
                        ),

                        SizedBox(height: 12),

                        Text(
                          'Map coming soon',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey,
                          ),
                        ),

                        SizedBox(height: 5),

                        Text(
                          'Google Maps will be connected here.',
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 15),

              // Current location
              GestureDetector(
                onTap: _useCurrentLocation,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 15,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Row(
                    children: [

                      Icon(
                        Icons.my_location,
                        color: primaryGreen,
                      ),

                      SizedBox(width: 12),

                      Text(
                        'Use my current location',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: primaryGreen,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 15),

              // Confirm button
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: _confirmLocation,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryGreen,
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      Text(
                        'Confirm Location',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      SizedBox(width: 10),

                      Icon(
                        Icons.arrow_forward,
                        size: 20,
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 15),
            ],
          ),
        ),
      ),
    );
  }
}