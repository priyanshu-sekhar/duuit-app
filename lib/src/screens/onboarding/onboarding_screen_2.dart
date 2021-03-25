import 'package:duuit/src/widgets/app_back_button.dart';
import 'package:duuit/src/widgets/header.dart';
import 'package:duuit/src/widgets/onboarding_header.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OnboardingScreen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: Header(),
        body: Container(
          margin: EdgeInsets.only(top: 20),
          child: Column(
            children: [
              backButtonWithHeader(context),
              onboardingSection(context),
              Image.asset('assets/g2.jpg')
            ],
          ),
        ));
  }

  Widget backButtonWithHeader(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 15, right: 64),
      alignment: Alignment.topLeft,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppBackButton(),
          OnboardingHeader(
            header: 'What brings you to ',
            highlightedText: 'duuit!',
          )
        ],
      ),
    );
  }

  Widget onboardingSection(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20, left: 36, right: 36, bottom: 42),
      child: Column(
        children: [
          categoriesRow(context, category1: 'reading.png', category2: 'meditate.png'),
          categoriesRow(context, category1: 'workout.png', category2: 'misc.png')
        ],
      ),
    );
  }

  Widget categoriesRow(BuildContext context,
      {String category1, String category2}) {
    return Row(
      children: [
        categoryImage(context, category1),
        categoryImage(context, category2)
      ],
    );
  }

  Widget categoryImage(BuildContext context, String asset) {
    return Container(
      child: Image.asset(
        'assets/$asset',
        height: 160,
      ),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
    );
  }
}
