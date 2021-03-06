import 'package:duuit/extensions/string_extension.dart';
import 'package:duuit/src/args/onboarding/onboarding_screen_3_args.dart';
import 'package:duuit/src/args/onboarding/onboarding_screen_5_args.dart';
import 'package:duuit/src/models/response/user_details_response.dart';
import 'package:duuit/src/screens/onboarding/onboarding_screen_5.dart';
import 'package:duuit/src/widgets/app_rich_text.dart';
import 'package:duuit/src/widgets/description_field.dart';
import 'package:duuit/src/widgets/header.dart';
import 'package:duuit/src/widgets/onboarding_header.dart';
import 'package:duuit/src/widgets/profile_pic.dart';
import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OnboardingScreen4 extends StatelessWidget {
  static const String route = '/onboarding/4';
  final UserDetailsResponse? userDetails;

  OnboardingScreen4({this.userDetails});

  @override
  Widget build(BuildContext context) {
    OnboardingScreen3Args args = fetchArgs(context);

    return Scaffold(
      appBar: Header(),
      body: Container(
        child: Column(
          children: [
            OnboardingHeader(
              header: 'So, to ',
              highlightedText: 'recap',
            ),
            Padding(padding: EdgeInsets.only(bottom: 20)),
            Container(
              margin: EdgeInsets.only(left: 28, right: 36),
              child: recapContent(args),
            ),
            Padding(padding: EdgeInsets.only(bottom: 20)),
            Container(
              margin: EdgeInsets.only(left: 40),
              alignment: AlignmentDirectional.topStart,
              child: AppRichText(
                leadingText:
                    '${EnumToString.convertToString(args.goalCategory).capitalize()} ',
                header: 'for ',
                highlightedText: args.goalDuration,
                fontSize: 22,
              ),
            ),
            Padding(padding: EdgeInsets.only(bottom: 30)),
            DescriptionField(),
            Padding(padding: EdgeInsets.only(bottom: 58)),
            trackProgressButton(context),
            Padding(padding: EdgeInsets.only(bottom: 16)),
            findBuddiesButton(context, args),
            Padding(padding: EdgeInsets.only(top: 24)),
            Image.asset('assets/g4.jpg'),
          ],
        ),
      ),
    );
  }

  OnboardingScreen3Args fetchArgs(BuildContext context) {
    final OnboardingScreen3Args args =
        ModalRoute.of(context)!.settings.arguments as OnboardingScreen3Args;
    return args;
  }

  Widget recapContent(OnboardingScreen3Args args) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ProfilePic(),
        Padding(padding: EdgeInsets.only(left: 16)),
        Expanded(
            child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(padding: EdgeInsets.only(bottom: 5)),
            Text(
              args.userName,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
            ),
            Padding(padding: EdgeInsets.only(bottom: 5)),
            Flexible(
              fit: FlexFit.loose,
              child: Text(args.userBio,
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Color.fromRGBO(0, 0, 0, 0.5))),
            )
          ],
        ))
      ],
    );
  }

  Widget trackProgressButton(BuildContext context) {
    return ElevatedButton(
      style: buttonStyle(color: Color(0xFF1071E2)),
      child: buttonContent(
          text: 'Track Progress',
          color: Colors.white,
          icon: Icons.check_circle_outline_sharp),
      onPressed: () {
        // Navigator.pushNamed(context, route);
        showDialog(
            context: context,
            builder: (_) => AlertDialog(title: Text('ye kaunsa page hai ??')));
      },
    );
  }

  Widget findBuddiesButton(BuildContext context, OnboardingScreen3Args args) {
    return ElevatedButton(
      style: buttonStyle(color: Colors.white),
      child: buttonContent(
          text: 'Find Buddies',
          color: Color(0xFF1071E2),
          icon: Icons.people_alt_outlined),
      onPressed: () {
        Navigator.pushNamed(
          context,
          OnboardingScreen5.route,
          arguments: OnboardingScreen5Args(
            userId: args.userId,
          ),
        );
      },
    );
  }

  ButtonStyle buttonStyle({Color? color}) {
    return ButtonStyle(
      backgroundColor: MaterialStateProperty.all<Color?>(color),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
      padding: MaterialStateProperty.all(
          EdgeInsets.only(top: 12, bottom: 12, left: 20, right: 13)),
    );
  }

  Widget buttonContent({required String text, Color? color, IconData? icon}) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          text,
          style: TextStyle(
              color: color, fontWeight: FontWeight.w600, fontSize: 14),
        ),
        Padding(padding: EdgeInsets.only(right: 10)),
        Icon(
          icon,
          color: color,
        ),
      ],
      mainAxisAlignment: MainAxisAlignment.center,
    );
  }
}
