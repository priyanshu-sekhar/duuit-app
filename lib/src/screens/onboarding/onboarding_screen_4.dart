import 'package:duuit/src/widgets/continue_button.dart';
import 'package:duuit/src/widgets/header.dart';
import 'package:duuit/src/widgets/onboarding_header.dart';
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
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            OnboardingHeader(
              header: 'Let\'s ',
              highlightedText: 'duuit!',
            ),
            Transform.translate(
              offset: Offset(-35, 0),
              child: Text(
                'Find buddies to do tasks with.',
                style: TextStyle(
                  color: Color(0xFF06172C),
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 20)),
            Expanded(child: buddyList()),
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

  Widget buddyList() {
    return Container();
  }
}