
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

  bool isMoving = false;

  void _onMapCreated(MapLibreMapController controller) {
    mapController = controller;
  }

  void _onCameraMove() {
    if (!isMoving && mounted) {
      setState(() {
        isMoving = true;
      });
    }
  }

 Future<void> _onCameraIdle() async {
  final controller = mapController;
  if (controller == null) return;

  try {
    final bounds = await controller.getVisibleRegion();

    final center = LatLng(
      (bounds.northeast.latitude + bounds.southwest.latitude) / 2,
      (bounds.northeast.longitude + bounds.southwest.longitude) / 2,
    );

    if (!mounted) return;

    setState(() {
      selectedLocation = center;
      isMoving = false;
    });
  } catch (e) {
    debugPrint('Location selection error: $e');
  }
}
  void _resetMap() {
    mapController?.animateCamera(
      CameraUpdate.newLatLngZoom(batna, 14),
    );
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
          // Map
          MapLibreMap(
            styleString:
                'https://tiles.openfreemap.org/styles/liberty',
            initialCameraPosition: const CameraPosition(
              target: batna,
              zoom: 14,
            ),
            onMapCreated: _onMapCreated,
            onCameraMove: (_) => _onCameraMove(),
            onCameraIdle: _onCameraIdle,
          ),

          // Center selection marker
          Center(
            child: IgnorePointer(
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 150),
                transform: Matrix4.translationValues(
                  0,
                  isMoving ? -8 : 0,
                  0,
                ),
                child: const Icon(
                  Icons.location_pin,
                  color: Color(0xFF006837),
                  size: 52,
                ),
              ),
            ),
          ),

          // Instructions
          Positioned(
            top: 15,
            left: 20,
            right: 20,
            child: Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(14),
                child: Text(
                  isMoving
                      ? 'Finding selected location...'
                      : 'Move the map to select your location',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),

          // Coordinates and reset
          Positioned(
            left: 20,
            right: 20,
            bottom: 100,
            child: Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  children: [
                    const Icon(
                      Icons.location_on,
                      color: Color(0xFF006837),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        '${selectedLocation.latitude.toStringAsFixed(5)}, '
                        '${selectedLocation.longitude.toStringAsFixed(5)}',
                        style: const TextStyle(fontSize: 13),
                      ),
                    ),
                    IconButton(
                      onPressed: _resetMap,
                      icon: const Icon(
                        Icons.my_location,
                        color: Color(0xFF006837),
                      ),
                      tooltip: 'Reset to Batna center',
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Confirm button
          Positioned(
            left: 20,
            right: 20,
            bottom: 25,
            child: ElevatedButton.icon(
              onPressed: isMoving ? null : _confirmLocation,
              icon: const Icon(Icons.check_circle_outline),
              label: const Text('Confirm Location'),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF006837),
                foregroundColor: Colors.white,
                disabledBackgroundColor: Colors.grey,
                minimumSize: const Size(double.infinity, 55),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
