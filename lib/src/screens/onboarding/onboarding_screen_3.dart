import 'package:duuit/src/args/onboarding/onboarding_screen_3_args.dart';
import 'package:duuit/src/screens/onboarding/onboarding_screen_4.dart';
import 'package:duuit/src/widgets/continue_button.dart';
import 'package:duuit/src/widgets/description_field.dart';
import 'package:duuit/src/widgets/header.dart';
import 'package:duuit/src/widgets/onboarding_header.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OnboardingScreen3 extends StatelessWidget {
  static const route = '/onboarding/3';

  @override
  Widget build(BuildContext context) {
    final OnboardingScreen3Args args =
        ModalRoute.of(context)!.settings.arguments as OnboardingScreen3Args;

    return Scaffold(
      appBar: Header(),
      body: Container(
        child: Column(
          children: [
            OnboardingHeader(
              header: 'What brings you to ',
              highlightedText: 'duuit!',
            ),
            Padding(padding: EdgeInsets.only(top: 40)),
            selectedCategory(args.selectedCategory),
            Padding(padding: EdgeInsets.only(top: 24)),
            goalDescription(),
            Padding(padding: EdgeInsets.only(top: 27)),
            doItFor(),
            Padding(padding: EdgeInsets.only(top: 48)),
            ContinueButton(route: OnboardingScreen4.route),
            Padding(padding: EdgeInsets.only(top: 48)),
            Image.asset('assets/g2.jpg')
          ],
        ),
      ),
    );
  }

  Widget selectedCategory(String? category) {
    return Container(
      margin: EdgeInsets.only(left: 36, right: 36),
      child: Image.asset(
        'assets/${category}_large.png',
      ),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
    );
  }

  Widget goalDescription() {
    return DescriptionField();
  }

  Widget doItFor() {
    const options = ['1 week', '2 weeks', '1 month'];

    return Container(
        margin: EdgeInsets.only(left: 40, right: 40),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Do it for :',
              style: TextStyle(
                color: Color(0xFF06172C),
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
            Padding(padding: EdgeInsets.only(left: 20)),
            Expanded(
              child: Container(
                height: 40,
                padding: EdgeInsets.all(10),
                child: DropdownButton(
                  value: options[0],
                  items: options.map((value) {
                    return DropdownMenuItem(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  icon: Icon(Icons.keyboard_arrow_down_sharp),
                  isExpanded: true,
                  onChanged: (dynamic newValue) {
                    print(newValue);
                  },
                  underline: Container(),
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 5),
                      blurRadius: 5,
                      color: Color.fromRGBO(6, 23, 44, 0.09),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ],
        ));
  }
}
