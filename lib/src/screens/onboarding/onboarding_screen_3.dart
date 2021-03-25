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
            Padding(padding: EdgeInsets.only(top: 20)),
            selectedCategory(args.selectedCategory), 
            Padding(padding: EdgeInsets.only(top: 5)),
            taskDescription(),
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

  Widget taskDescription() {
    return Stack(
        children: <Widget> [ 
        Container(
          height: 100,
          margin: EdgeInsets.only(left: 55, right: 55),
          padding: EdgeInsets.only(top: 10, bottom: 10),

          child: TextField(
            minLines: 10,
            maxLines: 10,
            decoration: textFieldDecoration(hintText: 'I would like to achieve'),
          ),
        ),
        Positioned(
          left: 60,
          top: 2,
          child: Container(
            padding: EdgeInsets.only(bottom: 5, left: 2, right: 2),
            color: Colors.white,
            child: Text(
              'Description',
              style: TextStyle(color: Colors.black, fontSize: 14),
            ),
          )
        ),
      ]
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

