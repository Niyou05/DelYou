
import 'package:flutter/material.dart';
import 'location_picker_screen.dart';
import '../screens/review_delivery_screen.dart';

class CreateDeliveryScreen extends StatefulWidget {
  const CreateDeliveryScreen({super.key});

  @override
  State<CreateDeliveryScreen> createState() => _CreateDeliveryScreenState();
}

class _CreateDeliveryScreenState extends State<CreateDeliveryScreen> {
   
final packageDescriptionController = TextEditingController();
final weightController = TextEditingController();
final instructionsController = TextEditingController();
final recipientNameController = TextEditingController();
final recipientPhoneController = TextEditingController(); 
  
  int selectedVehicle = 0;
  int selectedPackageSize = 0;
  int selectedDeliveryTime = 0;
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

            const Text(
              "package details",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
           ),

            const SizedBox(height: 15),

            TextField(
             controller:packageDescriptionController,
             decoration: InputDecoration(        
             hintText: 'what are you sending?',
              prefixIcon: const Icon(Icons.inventory_2_outlined),
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide.none,

              ),
             ), 
            ),

            const SizedBox(height:20),

            const Text(
            'package size',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 12),

            Row(

             children: [

              Expanded(
                child:_ChoiceButton(title: "small", isSelected: selectedPackageSize ==0,
                 onTap: (){
                 setState(() {
                   selectedPackageSize=0;
                 }); 

                 }), 
               ),

                const SizedBox(height: 10),



              Expanded(
                child:_ChoiceButton(title: "medium", isSelected: selectedPackageSize ==1,
                 onTap: (){
                  setState(() {
                 selectedPackageSize=1;   
                  });
                  
                 }), 
               ),

                 const SizedBox(height: 10),



              Expanded(
                child:_ChoiceButton(title: "large", isSelected: selectedPackageSize ==2,
                 onTap: (){
                  setState(() {
                    selectedPackageSize=2;
                  });
                  

                 }), 
               ),
 ],    
            ),

           const SizedBox(height: 20),

TextField(
controller: weightController, 
  keyboardType: TextInputType.number,
  decoration: InputDecoration(
    hintText: 'Weight(optional)',
    prefixIcon: const Icon(Icons.scale_outlined),
    suffixText: 'kg',
    filled: true,
    fillColor: Colors.white,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide.none,
    ),
  ),
),
           
           
           const SizedBox(height: 30),

const Text(
  'Additional instructions(optional)',
  style: TextStyle(
    fontSize: 19,
    fontWeight: FontWeight.bold,
  ),
),

const SizedBox(height: 15),

TextField(
  controller: instructionsController,
  maxLines: 4,
  decoration: InputDecoration(
    hintText: 'Any special instructions for the driver?',
    alignLabelWithHint: true,
    filled: true,
    fillColor: Colors.white,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide.none,
    ),
  ),
),

const SizedBox(height: 30),

const Text(
  'Recipient information',
  style: TextStyle(
    fontSize: 19,
    fontWeight: FontWeight.bold,
  ),
),

const SizedBox(height: 15),

TextField(
  controller: recipientNameController,
  decoration: InputDecoration(
    hintText: 'Recipient name',
    prefixIcon: const Icon(Icons.person_outline),
    filled: true,
    fillColor: Colors.white,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide.none,
    ),
  ),
),

const SizedBox(height: 12),

TextField(
  controller: recipientPhoneController,
  keyboardType: TextInputType.phone,
  decoration: InputDecoration(
    hintText: 'Recipient phone number',
    prefixIcon: const Icon(Icons.phone_outlined),
    filled: true,
    fillColor: Colors.white,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide.none,
    ),
  ),
),

const SizedBox(height: 30),

const Text(
  'Delivery time',
  style: TextStyle(
    fontSize: 19,
    fontWeight: FontWeight.bold,
  ),
),

const SizedBox(height: 15),

Row(
  children: [
    Expanded(
      child: OutlinedButton.icon(
        onPressed: () {},
        icon: const Icon(Icons.flash_on_outlined),
        label: const Text('ASAP'),
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
      ),
    ),

    const SizedBox(width: 12),

    Expanded(
      child: OutlinedButton.icon(
        onPressed: () {},
        icon: const Icon(Icons.schedule_outlined),
        label: const Text('Schedule'),
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
      ),
    ),
  ],
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
                onPressed: () {
                  Navigator.push(
                  context,
                  MaterialPageRoute(
                   builder: (context) => ReviewDeliveryscreen( pickupLocation: pickupLocation,
        destinationLocation: destinationLocation,
        vehicle: vehicles[selectedVehicle]['name'],
        vehiclePrice: vehicles[selectedVehicle]['price'],
        packageDescription: packageDescriptionController.text,
        packageSize: selectedPackageSize == 0
            ? 'Small'
            : selectedPackageSize == 1
                ? 'Medium'
                : 'Large',
        weight: weightController.text,
        instructions: instructionsController.text,
        recipientName: recipientNameController.text,
        recipientPhone: recipientPhoneController.text,
        deliveryTime: 'ASAP',),
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

class _ChoiceButton extends StatelessWidget {
  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  const _ChoiceButton({
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(vertical: 15),
        decoration: BoxDecoration(
          color: isSelected
              ? const Color(0xFF0B7A4B)
              : Colors.white,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: isSelected
                ? const Color(0xFF0B7A4B)
                : Colors.grey.shade300,
          ),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: isSelected
                  ? Colors.white
                  : Colors.black87,
            ),
          ),
        ),
      ),
    );
  }
}
