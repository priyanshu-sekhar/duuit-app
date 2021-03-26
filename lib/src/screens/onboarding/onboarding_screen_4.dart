import 'package:duuit/src/widgets/continue_button.dart';
import 'package:duuit/src/widgets/header.dart';
import 'package:duuit/src/widgets/onboarding_header.dart';
import 'package:expandable/expandable.dart';
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
              header: 'Let\'s ',
              highlightedText: 'duuit!',
            ),
            subtitle(),
            Padding(padding: EdgeInsets.only(top: 20)),
            buddyList(),
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
    return buddyTile();
  }

  Widget buddyTile() {
    return Container(
      margin: EdgeInsets.only(left: 36, right: 36, bottom: 18),
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                offset: Offset(3, 5),
                color: Color.fromRGBO(6, 23, 44, 0.09),
                blurRadius: 5),
          ],
          borderRadius: BorderRadius.circular(20)),
      child: ExpandablePanel(
        header: Container(
          padding: EdgeInsets.only(top: 10, left: 7, right: 10),
          height: 82,
          child: Container(
            child: Row(
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/profile_pic.png',
                  height: 60,
                ),
                Padding(padding: EdgeInsets.only(left: 5)),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [username(), goal()],
                )
              ],
            ),
          ),
          // decoration: BoxDecoration(color: Colors.red),
        ),
        collapsed: Container(
          height: 0,
        ),
        expanded: Text(
          'article.body',
          softWrap: true,
        ),
      ),
    );
  }

  Text goal() {
    return Text(
      'Workout',
      style: TextStyle(
          color: Color.fromRGBO(0, 0, 0, 0.5),
          fontSize: 14,
          fontWeight: FontWeight.w400),
    );
  }

  Text username() {
    return Text(
      'Siddharth Dash',
      style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 17,
          color: Color(0xFF06172C),
          height: 2),
    );
  }
}
