import 'package:duuit/src/args/onboarding/onboarding_screen_3_args.dart';
import 'package:duuit/src/args/user_args.dart';
import 'package:duuit/src/models/goal_category.dart';
import 'package:duuit/src/models/response/user_details_response.dart';
import 'package:duuit/src/screens/onboarding/onboarding_screen_3.dart';
import 'package:duuit/src/widgets/header.dart';
import 'package:duuit/src/widgets/onboarding_header.dart';
import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OnboardingScreen2 extends StatelessWidget {
  static const String route = '/onboarding/2';
  final UserDetailsResponse? userDetails;
  
  OnboardingScreen2({this.userDetails});

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
              category1: GoalCategory.reading, category2: GoalCategory.meditate),
          categoriesRow(context,
              category1: GoalCategory.workout, category2: GoalCategory.misc)
        ],
      ),
    );
  }

  Widget categoriesRow(BuildContext context,
      {required GoalCategory category1, required GoalCategory category2}) {
    return Row(
      children: [
        categoryImage(context, category1),
        categoryImage(context, category2)
      ],
    );
  }

  Widget categoryImage(BuildContext context, GoalCategory asset) {
    UserArgs args = fetchArgs(context);

    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          OnboardingScreen3.route,
          arguments: OnboardingScreen3Args(
            userId: args.userId,
            userName: args.userName!,
            userBio: args.userBio!,
            goalCategory: asset,
          ),
        );
      },
      child: Container(
        child: Image.asset(
          'assets/${EnumToString.convertToString(asset)}.png',
          height: 160,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }

  UserArgs fetchArgs(BuildContext context) {
    final UserArgs args = userDetails != null ? UserArgs(
      userId: userDetails!.uId,
      userName: userDetails!.name,
      userBio: userDetails!.bio
    ) : ModalRoute.of(context)!.settings.arguments as UserArgs;
    return args;
  }
}
