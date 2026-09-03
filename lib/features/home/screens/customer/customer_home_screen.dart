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

    



    );
   

  }
  }