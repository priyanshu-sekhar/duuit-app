import 'package:duuit/src/args/onboarding/onboarding_screen_3_args.dart';
import 'package:duuit/src/widgets/header.dart';
import 'package:duuit/src/widgets/onboarding_header.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OnboardingScreen3 extends StatelessWidget {
  static const route = '/onboarding/3';

  @override
  Widget build(BuildContext context) {
    final OnboardingScreen3Args args = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: Header(),
      body: Container(
        margin: EdgeInsets.only( top: 20),
        child: Column(
          children: [
            OnboardingHeader(
              header: 'What brings you to ',
              highlightedText: 'duuit!',
            ),
            Padding(padding: EdgeInsets.only(top: 40)),
            selectedCategory(args.selectedCategory)
          ],
        ),
      ),
    );
  }

  Widget selectedCategory(String category) {
    return Container(
      child: Image.asset(
        'assets/${category}_large.png',
        height: 108,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20)
      ),
    );
  }
}