
import 'package:flutter/material.dart';
import 'package:maplibre_gl/maplibre_gl.dart';

class DeliveryMapScreen extends StatefulWidget {
  const DeliveryMapScreen({super.key});

  @override
  State<DeliveryMapScreen> createState() =>
      _DeliveryMapScreenState();
}

class _DeliveryMapScreenState extends State<DeliveryMapScreen> {
  static const LatLng batna = LatLng(35.5559, 6.1743);

  MapLibreMapController? mapController;

  LatLng selectedLocation = batna;

  void _onMapCreated(MapLibreMapController controller) {
    mapController = controller;
  }

  void _onCameraIdle() {
    final controller = mapController;
    if (controller == null) return;

    final location = controller.cameraPosition.target;

    setState(() {
      selectedLocation = location;
    });
  }

  void _confirmLocation() {
    Navigator.pop(context, selectedLocation);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Location'),
        backgroundColor: const Color(0xFF006837),
        foregroundColor: Colors.white,
      ),
      body: Stack(
        children: [
          MapLibreMap(
            styleString:
                'https://tiles.openfreemap.org/styles/liberty',
            initialCameraPosition: const CameraPosition(
              target: batna,
              zoom: 14,
            ),
            onMapCreated: _onMapCreated,
            onCameraIdle: _onCameraIdle,
          ),

          // Fixed marker in the center
          const Center(
            child: IgnorePointer(
              child: Icon(
                Icons.location_pin,
                color: Color(0xFF006837),
                size: 48,
              ),
            ),
          ),

          // Confirm button
          Positioned(
            left: 20,
            right: 20,
            bottom: 25,
            child: ElevatedButton(
              onPressed: _confirmLocation,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF006837),
                foregroundColor: Colors.white,
                minimumSize: const Size(double.infinity, 55),
              ),
              child: const Text('Confirm Location'),
            ),
          ),
        ],
      ),
    );
  }
}

