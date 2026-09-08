import 'dart:async';
import 'package:flutter/material.dart';
import 'verified_screen.dart';


class VerifyPhoneScreen extends StatefulWidget {
  final String phoneNumber;

  const VerifyPhoneScreen({
    super.key,
    required this.phoneNumber,
  });

  @override
  State<VerifyPhoneScreen> createState() => _VerifyPhoneScreenState();
}

class _VerifyPhoneScreenState extends State<VerifyPhoneScreen> {
  final List<TextEditingController> _controllers =
      List.generate(4, (_) => TextEditingController());

  final List<FocusNode> _focusNodes =
      List.generate(4, (_) => FocusNode());

  Timer? _timer;
  int _secondsRemaining = 42;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer?.cancel();

    setState(() {
      _secondsRemaining = 42;
    });

    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        if (_secondsRemaining > 0) {
          setState(() {
            _secondsRemaining--;
          });
        } else {
          timer.cancel();
        }
      },
    );
  }

  String get _formattedTime {
    final minutes = (_secondsRemaining ~/ 60)
        .toString()
        .padLeft(2, '0');

    final seconds = (_secondsRemaining % 60)
        .toString()
        .padLeft(2, '0');

    return '$minutes:$seconds';
  }

  void _onCodeChanged(String value, int index) {
    if (value.isNotEmpty && index < 3) {
      _focusNodes[index + 1].requestFocus();
    }

      if (value.isEmpty && index > 0) {
        _focusNodes[index - 1].requestFocus();
      }
    }

    String get _code {
      return _controllers.map((controller) => controller.text).join();
    }

    void _verifyCode() {
      if (_code.length != 4) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Please enter the 4-digit code'),          
          ),
        );
      return;
      }

      debugPrint('Verification code: $_code');

  Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const VerifiedScreen(),
        ),
  );
  
     

    }

  void _resendCode() {
    if (_secondsRemaining > 0) return;

    _startTimer();

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('A new verification code has been sent'),
      ),
    );
  }

  @override
  void dispose() {
    _timer?.cancel();

    for (final controller in _controllers) {
      controller.dispose();
    }

    for (final node in _focusNodes) {
      node.dispose();
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFA),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            children: [

              // Back button
              Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Color(0xFF4A4A4A),
                  ),
                ),
              ),

              const SizedBox(height: 18),

              // Lock icon
              Container(
                width: 50,
                height: 50,
                decoration: const BoxDecoration(
                  color: Color(0xFF007A43),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.lock,
                  color: Colors.white,
                  size: 24,
                ),
              ),

              const SizedBox(height: 18),

              // Title
              const Text(
                'Verify Phone',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF202020),
                ),
              ),

              const SizedBox(height: 6),

              // Description
              const Text(
                'Enter the 4-digit code sent to',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 13,
                  color: Color(0xFF666666),
                ),
              ),

              const SizedBox(height: 3),

              // Phone number
              Text(
                widget.phoneNumber,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF006837),
                ),
              ),

              const SizedBox(height: 25),

              // OTP fields
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(
                  4,
                  (index) {
                    return SizedBox(
                      width: 43,
                      height: 48,
                      child: TextField(
                        controller: _controllers[index],
                        focusNode: _focusNodes[index],
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        maxLength: 1,

                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),

                        decoration: InputDecoration(
                          counterText: '',
                          filled: true,
                          fillColor: Colors.white,

                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.circular(9),
                            borderSide: const BorderSide(
                              color: Color(0xFFD0D5D2),
                            ),
                          ),

                          enabledBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.circular(9),
                            borderSide: const BorderSide(
                              color: Color(0xFFD0D5D2),
                            ),
                          ),

                          focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.circular(9),
                            borderSide: const BorderSide(
                              color: Color(0xFF006837),
                              width: 2,
                            ),
                          ),
                        ),

                        onChanged: (value) {
                          _onCodeChanged(value, index);
                        },
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(height: 27),

              // Resend
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Didn't receive the code? ",
                    style: TextStyle(
                      fontSize: 11,
                      color: Color(0xFF666666),
                    ),
                  ),

                  GestureDetector(
                    onTap: _secondsRemaining == 0
                        ? _resendCode
                        : null,
                    child: Text(
                      'Resend Code',
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                        color: _secondsRemaining == 0
                            ? const Color(0xFF006837)
                            : const Color(0xFF789080),
                      ),
                    ),
                  ),

                  const SizedBox(width: 5),

                  Text(
                    '($_formattedTime)',
                    style: const TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF789080),
                    ),
                  ),
                ],
              ),

              const Spacer(),

              // Verify button
              SizedBox(
                width: double.infinity,
                height: 43,
                child: ElevatedButton(
                  onPressed: _verifyCode,
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        const Color(0xFF005C2E),
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(9),
                    ),
                  ),
                  child: const Text(
                    'Verify & Continue  →',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 18),
            ],
          ),
        ),
      ),
    );
  }
}