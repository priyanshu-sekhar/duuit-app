import 'package:duuit/src/screens/onboarding/onboarding_screen_5.dart';
import 'package:duuit/src/widgets/app_rich_text.dart';
import 'package:duuit/src/widgets/description_field.dart';
import 'package:duuit/src/widgets/header.dart';
import 'package:duuit/src/widgets/onboarding_header.dart';
import 'package:duuit/src/widgets/profile_pic.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OnboardingScreen4 extends StatelessWidget {
  static const route = '/onboarding/4';

  @override
  Widget build(BuildContext context) {
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
              child: recapContent(),
            ),
            Padding(padding: EdgeInsets.only(bottom: 20)),
            Container(
              margin: EdgeInsets.only(left: 40),
              alignment: AlignmentDirectional.topStart,
              child: AppRichText(
                leadingText: 'Read ',
                header: 'for ',
                highlightedText: '2 weeks',
                fontSize: 22,
              ),
            ),
            Padding(padding: EdgeInsets.only(bottom: 30)),
            DescriptionField(),
            Padding(padding: EdgeInsets.only(bottom: 58)),
            trackProgressButton(context),
            Padding(padding: EdgeInsets.only(bottom: 16)),
            findBuddiesButton(context),
            Padding(padding: EdgeInsets.only(top: 24)),
            Image.asset('assets/g4.jpg'),
          ],
        ),
      ),
    );
  }

  Widget recapContent() {
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
                  'Siddharth Dash',
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600
                  ),
                ),
                Padding(padding: EdgeInsets.only(bottom: 5)),
                Flexible(
                  fit: FlexFit.loose,
                  child: Text(
                      'Meri ek tang nakli hai...mai hockey ka bahut acha player tha.....',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Color.fromRGBO(0, 0, 0, 0.5)
                      )
                  ),
                )

              ],
            )
        )

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
        showDialog(context: context, builder: (_) => AlertDialog(title: Text('ye kaunsa page hai ??')));
      },
    );
  }

  Widget findBuddiesButton(BuildContext context) {
    return ElevatedButton(
      style: buttonStyle(color: Colors.white),
      child: buttonContent(
          text: 'Find Buddies',
          color: Color(0xFF1071E2),
          icon: Icons.people_alt_outlined),
      onPressed: () {
        Navigator.pushNamed(context, OnboardingScreen5.route);
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
