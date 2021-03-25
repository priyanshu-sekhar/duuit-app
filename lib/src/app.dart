import 'package:duuit/src/provider/auth_provider.dart';
import 'package:duuit/src/screens/login_screen.dart';
import 'package:duuit/src/screens/onboarding/onboarding_screeen_1.dart';
import 'package:duuit/src/screens/onboarding/onboarding_screen_2.dart';
import 'package:duuit/src/screens/onboarding/onboarding_screen_3.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AuthProvider(
      child: MaterialApp(
        title: 'duuit!!',
        theme: ThemeData(
          primaryColor: Color(0xFF1071E2)
        ),
        routes: {
          '/': (context) => LoginScreen(),
          OnboardingScreen1.route: (context) => OnboardingScreen1(),
          OnboardingScreen2.route: (context) => OnboardingScreen2(),
          OnboardingScreen3.route: (context) => OnboardingScreen3()
        },
      ),
    );
  }
}