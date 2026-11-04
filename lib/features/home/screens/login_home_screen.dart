import 'package:flutter/material.dart';
import 'package:DelYou/features/home/screens/customer/customer_home_screen.dart';





class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  bool isPasswordVisible = false;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [

            const Text('Welcome Back'),

            TextField(
              decoration: const InputDecoration(
                hintText: 'Email',
              ),
            ),

            TextField(
              obscureText: !isPasswordVisible,
              decoration: InputDecoration(
                hintText: 'Password',
                suffixIcon: IconButton(
                  icon: Icon(
                    isPasswordVisible
                        ? Icons.visibility
                        : Icons.visibility_off,
                  ),
                  onPressed: () {
                    setState(() {
                      isPasswordVisible = !isPasswordVisible;
                    });
                  },
                ),
              ),
            ),

           ElevatedButton(
  onPressed: () {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const CustomerHomeScreen(),
      ),
    );
  },
  child: const Text('Login'),
)

          ],
        ),
      ),
    );
  }
}