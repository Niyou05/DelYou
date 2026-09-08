
import 'package:flutter/material.dart';
import 'customer/customer_home_screen.dart';



class RegistrationScreen extends StatefulWidget {

  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  // Controllers
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _referralController = TextEditingController();

  bool _agreeToTerms = false;

  // DelYou main color
  static const Color primaryGreen = Color(0xFF006837);

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _referralController.dispose();
    super.dispose();
  }

  void _createAccount() {
    final name = _nameController.text.trim();
    final phone = _phoneController.text.trim();

    // Validate name
    if (name.isEmpty) {
      _showMessage('Please enter your full name.');
      return;
    }

    // Validate phone
    if (phone.isEmpty) {
      _showMessage('Please enter your phone number.');
      return;
    }

    if (phone.length < 9) {
      _showMessage('Please enter a valid phone number.');
      return;
    }

    // Validate terms
    if (!_agreeToTerms) {
      _showMessage(
        'Please agree to the Terms & Conditions.',
      );
      return;
    }

    // TODO:
    // Later we will send the phone number to the backend
    // and navigate to OTP verification.

   Navigator.pushReplacement(
    context,
    MaterialPageRoute(
      builder: (context) => const CustomerHomeScreen(),
    ),
  );
  }

  void _showMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void _goToLogin() {
    // TODO:
    // Navigate to LoginScreen later.
    _showMessage('Login screen coming soon.');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F9F8),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // =========================
              // Back Button
              // =========================

              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back_ios_new,
                  size: 20,
                ),
                color: primaryGreen,
                style: IconButton.styleFrom(
                  backgroundColor: const Color(0xFFE7F2EC),
                  padding: const EdgeInsets.all(12),
                ),
              ),

              const SizedBox(height: 1),

              // =========================
              // Logo
              // =========================

              Center(
                child: Image.asset(
                  'assets/images/Logo1.png',
                  height: 90,
                  fit: BoxFit.contain,
                  errorBuilder: (
                    context,
                    error,
                    stackTrace,
                  ) {
                    return Column(
                      children: [
                        const Icon(
                          Icons.local_shipping_rounded,
                          size: 55,
                          color: primaryGreen,
                        ),
                        const SizedBox(height: 8),
                        RichText(
                          text: const TextSpan(
                            children: [
                              TextSpan(
                                text: 'Del',
                                style: TextStyle(
                                  color: Color.fromARGB(255, 147, 158, 69),
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextSpan(
                                text: 'You',
                                style: TextStyle(
                                  color: Color(0xFF35A853),
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),

              const SizedBox(height:10),

              // =========================
              // Title
              // =========================

              const Text(
                'Create your account',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 31,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF123C2A),
                ),
              ),

              const SizedBox(height: 5),
              
              const Text(
                'Join DelYou and start sending deliveries.',
                  textAlign: TextAlign.center,
                  style: TextStyle(  
                  fontWeight: FontWeight.bold,  
                  fontSize: 18,
                  color: Color.fromARGB(255, 88, 113, 35),
                  height: 1,
                ),
              ),

              const SizedBox(height: 15),

              // =========================
              // Account Type
              // =========================

              const Text(
                'Account Type',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF26332E),
                ),
              ),

              const SizedBox(height: 5),

              Container(
                height: 50,
                decoration: BoxDecoration(
                  color: const Color(0xFFE5E8E7),
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.all(4),
                child: Row(
                  children: [

                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              BorderRadius.circular(9),
                        ),
                        alignment: Alignment.center,
                        child: const Text(
                          'Customer',
                          style: TextStyle(
                            color: primaryGreen,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),

                    Expanded(
                      child: InkWell(
                        onTap: () {
                          _showMessage(
                            'Courier registration will be available soon.',
                          );
                        },
                        borderRadius:
                            BorderRadius.circular(9),
                        child: const Center(
                          child: Text(
                            'Courier',
                            style: TextStyle(
                              color: Color(0xFF555D59),
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 15),

              // =========================
              // Full Name
              // =========================

              const Text(
                'Full Name',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF26332E),
                ),
              ),

              const SizedBox(height: 5),

              _buildTextField(
                controller: _nameController,
                hintText: 'John Doe',
                icon: Icons.person_outline,
                textInputType: TextInputType.name,
              ),

              const SizedBox(height: 15),

              // =========================
              // Phone Number
              // =========================

              const Text(
                'Phone Number',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF26332E),
                ),
              ),

              const SizedBox(height: 5),

              Container(
                height: 56,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: const Color(0xFFB8C5BE),
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [

                    // Algeria code
                    Container(
                      width: 90,
                      decoration: const BoxDecoration(
                        border: Border(
                          right: BorderSide(
                            color: Color(0xFFB8C5BE),
                          ),
                        ),
                      ),
                      alignment: Alignment.center,
                      child: const Text(
                        '+213',
                        style: TextStyle(
                          fontSize: 15,
                          color: Color(0xFF4E5954),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),

                    // Phone input
                    Expanded(
                      child: TextField(
                        controller: _phoneController,
                        keyboardType:
                            TextInputType.phone,
                        maxLength: 9,
                        decoration: const InputDecoration(
                          hintText: '555 123 456',
                          hintStyle: TextStyle(
                            color: Color(0xFF9BA7A1),
                          ),
                          border: InputBorder.none,
                          counterText: '',
                          contentPadding:
                              EdgeInsets.symmetric(
                            horizontal: 16,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 15),

              // =========================
              // Referral Code
              // =========================

              Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'Referral Code',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF26332E),
                    ),
                  ),
                  Text(
                    'Optional',
                    style: TextStyle(
                      fontSize: 12,
                      color: Color(0xFF69736F),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 5),

              _buildTextField(
                controller: _referralController,
                hintText: 'Enter referral code',
                icon: Icons.card_giftcard_outlined,
                textInputType: TextInputType.datetime,
              ),

              const SizedBox(height: 20),

              // =========================
              // Terms
              // =========================

              Row(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [

                  SizedBox(
                    width: 24,
                    height: 24,
                    child: Checkbox(
                      value: _agreeToTerms,
                      activeColor: primaryGreen,
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(4),
                      ),
                      onChanged: (value) {
                        setState(() {
                          _agreeToTerms =
                              value ?? false;
                        });
                      },
                    ),
                  ),

                  const SizedBox(width: 8),

                  Expanded(
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 2),
                      child: RichText(
                        text: const TextSpan(
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                            color: Color(0xFF68736F),
                            height: 1.4,
                          ),
                          children: [
                            TextSpan(
                              text:
                                  'I agree to the ',
                            ),
                            TextSpan(
                              text:
                                  'Terms & Conditions',
                              style: TextStyle(
                                color: primaryGreen,
                                fontWeight:
                                    FontWeight.w600,
                              ),
                            ),
                            TextSpan(
                              text: ' and ',
                            ),
                            TextSpan(
                              text:
                                  'Privacy Policy',
                              style: TextStyle(
                                color: primaryGreen,
                                fontWeight:
                                    FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 25),

              // =========================
              // Create Account Button
              // =========================

              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: _createAccount,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryGreen,
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(12),
                    ),
                  ),
                  child: const Row(
                    mainAxisAlignment:
                        MainAxisAlignment.center,
                    children: [

                      Text(
                        'Create Account',
                        style: TextStyle(
                          fontSize: 16,
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

              const SizedBox(height: 28),

              // =========================
              // Login
              // =========================

              Center(
                child: GestureDetector(
                  onTap: _goToLogin,
                  child: RichText(
                    text: const TextSpan(
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xFF68736F),
                      ),
                      children: [
                        TextSpan(
                          text:
                              'Already have an account? ',
                        ),
                        TextSpan(
                          text: 'Log in',
                          style: TextStyle(
                            color: primaryGreen,
                            fontWeight:
                                FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 25),
            ],
          ),
        ),
      ),
    );
  }

  // =========================
  // Reusable Text Field
  // =========================

  Widget _buildTextField({
    required TextEditingController controller,
    required String hintText,
    required IconData icon,
    required TextInputType textInputType,
  }) {
    return Container(
      height: 56,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: const Color(0xFFB8C5BE),
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        controller: controller,
        keyboardType: textInputType,
        decoration: InputDecoration(
          prefixIcon: Icon(
            icon,
            color: const Color(0xFF68736F),
            size: 21,
          ),
          hintText: hintText,
          hintStyle: const TextStyle(
            color: Color(0xFF9BA7A1),
            fontSize: 14,
          ),
          border: InputBorder.none,
          contentPadding:
              const EdgeInsets.symmetric(
            vertical: 17,
          ),
        ),
      ),
    );
  }
}