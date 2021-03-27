import 'package:duuit/src/screens/onboarding/onboarding_screen_4.dart';
import 'package:duuit/src/screens/tiles/buddy_tile.dart';
import 'package:duuit/src/widgets/continue_button.dart';
import 'package:duuit/src/widgets/header.dart';
import 'package:duuit/src/widgets/onboarding_header.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OnboardingScreen5 extends StatelessWidget {
  static const route = '/onboarding/5';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(),
      body: Container(
        child: Column(
          children: [
            OnboardingHeader(
              header: 'Let\'s ',
              highlightedText: 'duuit!',
            ),
            subtitle(),
            Padding(padding: EdgeInsets.only(top: 20)),
            Container(
              padding: EdgeInsets.only(left: 36, right: 36),
              child: buddyList(),
            ),
            Spacer(),
            Padding(padding: EdgeInsets.only(top: 24)),
            ContinueButton(),
            Padding(padding: EdgeInsets.only(top: 24)),
            Image.asset('assets/g3.jpg'),
            Padding(padding: EdgeInsets.only(bottom: 66))
          ],
        ),
      ),
    );
  }

  Widget subtitle() {
    return Transform.translate(
      offset: Offset(-25, 0),
      child: Text(
        'Find buddies to do tasks with.',
        style: TextStyle(
          color: Color(0xFF06172C),
          fontWeight: FontWeight.w600,
          fontSize: 18,
        ),
      ),
    );
  }

  Widget buddyList() {
    return ListView(shrinkWrap: true, children: [
      BuddyTile()
    ]);
  }
}
