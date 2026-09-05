import 'package:DelYou/features/delivery/screens/create_delivery_screen.dart';
import 'package:flutter/material.dart';


class CustomerHomeScreen extends StatelessWidget {
  const CustomerHomeScreen ({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(

    appBar:AppBar(
   backgroundColor: Colors.white,
   elevation: 4,
   shadowColor: Colors.black26,
    title: Row(
      children: [
          const CircleAvatar(
            backgroundImage: AssetImage('assets/images/ss.jpg'),
          ),
          const SizedBox(width:70),
          const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   Text("Welcome back,",
                    style: TextStyle(
                      fontSize: 12,
                    ),     
                   
                   
              ),
                   Text("Ready to Deliver? ",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold, 
                      ),
                    ),
                ],
                   ),  

                ],

          ),
    actions: [
        IconButton(onPressed: () {},
                   icon: const Icon(Icons.notifications_none),
                   ),

    ],  
      
      
      
    ),

body: Padding(
    padding: const EdgeInsets.all(16),

child: Column(
  crossAxisAlignment: CrossAxisAlignment.center,
      children: [
       const Text(
        "Where Do You Want to Send Somthing?",
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold

        ),
    ),

        const SizedBox(height: 10),
         const Text(
        "Fast, reliable delivery across city",
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: 20,
                        ),
                    ),
                    
const SizedBox(height: 24),

Container(
  width: double.infinity,
  height: 65,
  decoration: BoxDecoration(
color: const Color(0xFF006837),
borderRadius: BorderRadius.circular(16),
  ),

child: InkWell(
borderRadius: BorderRadius.circular(10),
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context)  => const CreateDeliveryScreen(),
        ),
      );
    },



  child: Row(
  mainAxisAlignment: MainAxisAlignment.center,
     
      children: [
     
       const Icon(
        Icons.add,
        color: Colors.white,
       ),
       
       
        const Text(
          "create delivery",
          textAlign: TextAlign.center,
          style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
          color: Colors.white,  
          ),
        ),

      ],

  ),
),
),

     const SizedBox(height: 25),

     Container(
  width: double.infinity,
  padding: const EdgeInsets.all(16),
  decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(10),
    boxShadow: [
      BoxShadow(
        color: Colors.black,
        blurRadius: 10,
        offset: const Offset(0, 4),
      ),
    ],
  ),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      // Recent title
      Row(
        children: [
          Icon(
            Icons.history,
            color: Colors.green.shade700,
            size: 20,
          ),
          const SizedBox(width: 8),
          const Text(
            'Recent',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
        ],
      ),
  
      
      
      const SizedBox(height: 18),

      // Kechaida
      _recentlocation(
        icon: Icons.location_on_outlined,
        title: 'Kechaida',
      ),

      const SizedBox(height: 16),

      // City Center
      _recentlocation(
        icon: Icons.location_on_outlined,
        title: 'City Center',
      ),

      const SizedBox(height: 16),

      // Lambarkia
      _recentlocation(
        icon: Icons.location_on_outlined,
        title: 'Lambarkia',
      ),
    ],
  ),
),
 
 
 
      ], 
),
),
    );


  }

  Row _recentlocation({required IconData icon, required String title}) {

return Row(
    children: [
      Icon(
        icon,
        color: Colors.grey.shade400,
        size: 20,
      ),
      const SizedBox(width: 10),
      Text(
        title,
        style: const TextStyle(
          fontSize: 13,
          color: Colors.black87,
        ),
      ),
    ],
  );

  }


  }