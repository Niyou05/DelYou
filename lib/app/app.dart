import 'package:flutter/material.dart';
import '../features/home/screens/home_screen.dart';
import 'theme.dart';

class BatnaDeliveryApp extends StatelessWidget {
  const BatnaDeliveryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'liverily',
      theme: AppTheme.lightTheme,
      home: const HomeScreen(),
    );
  }

}