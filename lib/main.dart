import 'package:flutter/material.dart';
import 'package:polytechvr/screens/onboarding/first_onboarding_screen.dart';

void main() {
  runApp(const PolytechAR());
}

class PolytechAR extends StatelessWidget {
  const PolytechAR({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FirstOnboardingScreen(),
    );
  }
}