import 'package:duuit/src/screens/onboarding/onboarding_screen_2.dart';
import 'package:duuit/src/widgets/continue_button.dart';
import 'package:duuit/src/widgets/header.dart';
import 'package:duuit/src/widgets/onboarding_header.dart';
import 'package:duuit/src/widgets/profile_pic.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OnboardingScreen1 extends StatelessWidget {
  static const route = '/onboarding/1';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: Header(),
        body: Container(
          child: Stack(
            children: [
              OnboardingHeader(),
              onboardingSection(context)
            ],
          ),
        ));
  }

  Widget onboardingSection(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 60, right: 60),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(padding: EdgeInsets.only(top: 70)),
          ProfilePic(),
          userName(),
          Padding(padding: EdgeInsets.only(bottom: 15)),
          userBio(),
          Padding(padding: EdgeInsets.only(bottom: 42)),
          ContinueButton(route: OnboardingScreen2.route),
          Padding(padding: EdgeInsets.only(bottom: 48)),
          Image.asset('assets/g1.jpg',)
        ],
      ),
      // color: Colors.orange,
    );
  }

  Widget backButton(BuildContext context) {
    return Positioned(
      child: BackButton(),
    );
  }

  Widget userName() {
    return Container(
      height: 40,
      child: TextField(
        decoration: textFieldDecoration(hintText: 'Choose a cool username'),
      ),
    );
  }

  Widget userBio() {
    return Container(
      height: 144,
      child: TextField(
        minLines: 10,
        maxLines: 10,
        decoration: textFieldDecoration(hintText: 'Write about yourself'),
      ),
    );
  }

  InputDecoration textFieldDecoration({String hintText}) {
    return InputDecoration(
        contentPadding: EdgeInsets.all(10),
        focusedBorder: textFieldBorder(),
        enabledBorder: textFieldBorder(),
        hintText: hintText,
        hintStyle: TextStyle(
          fontSize: 14.0,
          fontWeight: FontWeight.w400,
        )
    );
  }

  OutlineInputBorder textFieldBorder() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Colors.black45)
    );
  }
}
