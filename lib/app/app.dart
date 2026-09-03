import 'package:flutter/material.dart';
import '../features/home/screens/customer/customer_home_screen.dart';

class BatnaDeliveryApp extends StatelessWidget {
const BatnaDeliveryApp ({super.key});
@override
Widget build(BuildContext context) {
  return MaterialApp(
   debugShowCheckedModeBanner: false,
    home:const CustomerHomeScreen(), 
  );
} 
}
