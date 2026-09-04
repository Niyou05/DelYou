import 'package:flutter/material.dart';

class CustomerHomeScreen extends StatelessWidget {
  const CustomerHomeScreen ({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(

    appBar:AppBar(
    title: Row(
      children: [
          const CircleAvatar(
            backgroundImage: AssetImage('assets/images/ss.png'),
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
            fontSize: 24,
            fontWeight: FontWeight.bold

        ),
    ),

        const SizedBox(height: 10,),
         const Text(
        "Fast, reliable delivery across city",
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: 14,
                        ),
                    ),
const SizedBox(height: 24,),

      Container(
        height: 70,
        width: double.infinity,
        decoration: BoxDecoration(
        color: const Color.fromARGB(255, 66, 108, 67),
        borderRadius: BorderRadius.circular(16),
        ),
      
      
      
      
        child: Row(
         mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.add,
              color: Colors.white,
              ),

const SizedBox(width: 12),
         
          const Text(
                'Create Delivery',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,   
                    color: Colors.white, 
              ),
            ) ,   
          ],
       ),
     ),          
 const SizedBox(height: 30),

          const Text(
                'Recent Deliveries',
                 style: TextStyle(
                 fontSize: 20,
                 fontWeight: FontWeight.bold,
               ),
            ),
    
    const SizedBox(height: 16),

     InkWell(
  onTap: () {
    // لاحقًا نفتح تفاصيل التوصيل
  },
  child: Container(
    // Container الحالي
  ),
),

const SizedBox(height: 12),
     
      Container(
  height: 90,
  width: double.infinity,
  decoration: BoxDecoration(
     color: Colors.white,
     borderRadius: BorderRadius.circular(16),
     boxShadow: [
  BoxShadow(
    blurRadius: 8,
    offset: Offset(0, 3),
  ),
],
  ),
child: Row(
    children: [
    const Icon(
  Icons.local_shipping_outlined,
  size: 32,
),  
  const SizedBox(width: 12),
  Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    const Text(
  'Delivery #1024',
  style: TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
  ),
),
 
 const Text(
  'Batna → Fesdis',
  style: TextStyle(
    fontSize: 14,
  ),
),
 
 Container(
  padding: const EdgeInsets.symmetric(
    horizontal: 16,
    vertical: 10,
  ),
  decoration: BoxDecoration(
    color: Colors.green.shade100,
    borderRadius: BorderRadius.circular(16),
  ),
  child: const Text(
    'Delivered',
    style: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.bold,
      color: Colors.green,
    ),
  ),
),
 
  
  ],
),
 const Spacer(),  
  const Icon(
  Icons.arrow_forward_ios,
  size: 18,
),
  
  
    ],
  ),

),
        
        
        
         ],
),
),
);
  }
  }