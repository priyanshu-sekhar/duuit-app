import 'package:duuit/src/args/onboarding/onboarding_screen_3_args.dart';
import 'package:duuit/src/screens/onboarding/onboarding_screen_3.dart';
import 'package:duuit/src/widgets/header.dart';
import 'package:duuit/src/widgets/onboarding_header.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OnboardingScreen2 extends StatelessWidget {
  static const route = '/onboarding/2';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: Header(),
        body: Container(
          child: Column(
            children: [
              OnboardingHeader(
                header: 'What brings you to ',
                highlightedText: 'duuit!',
              ),
              onboardingSection(context),
              Image.asset('assets/g2.jpg')
            ],
          ),
        ));
  }

  Widget onboardingSection(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 40, left: 36, right: 36, bottom: 42),
      child: Column(
        children: [
          categoriesRow(context,
              category1: 'reading', category2: 'meditate'),
          categoriesRow(context,
              category1: 'workout', category2: 'misc')
        ],
      ),
    );
  }

  Widget categoriesRow(BuildContext context,
      {String? category1, String? category2}) {
    return Row(
      children: [
        categoryImage(context, category1),
        categoryImage(context, category2)
      ],
    );
  }

  Widget categoryImage(BuildContext context, String? asset) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          OnboardingScreen3.route,
          arguments: OnboardingScreen3Args(
            selectedCategory: asset,
          ),
        );
      },
      child: Container(
        child: Image.asset(
          'assets/$asset.png',
          height: 160,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}
