import 'package:duuit/src/args/onboarding/onboarding_screen_3_args.dart';
import 'package:duuit/src/blocs/onboarding/onboarding_screen_3_bloc.dart';
import 'package:duuit/src/models/goal_category.dart';
import 'package:duuit/src/models/goal_durations.dart';
import 'package:duuit/src/widgets/continue_button.dart';
import 'package:duuit/src/widgets/description_field.dart';
import 'package:duuit/src/widgets/header.dart';
import 'package:duuit/src/widgets/onboarding_header.dart';
import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OnboardingScreen3 extends StatelessWidget {
  static const route = '/onboarding/3';

  @override
  Widget build(BuildContext context) {
    final OnboardingScreen3Args args = ModalRoute.of(context)!.settings.arguments as OnboardingScreen3Args;
    final OnboardingScreen3Bloc bloc = Provider.of<OnboardingScreen3Bloc>(context);

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
            selectedCategory(args.goalCategory),
            Padding(padding: EdgeInsets.only(top: 24)),
            goalDescription(bloc),
            Padding(padding: EdgeInsets.only(top: 27)),
            doItFor(bloc),
            Padding(padding: EdgeInsets.only(top: 48)),
            submit(bloc, args),
            Padding(padding: EdgeInsets.only(top: 48)),
            Image.asset('assets/g2.jpg')
          ],
        ),
      ),
    );
  }

  Widget submit(OnboardingScreen3Bloc bloc, OnboardingScreen3Args args) {
    return StreamBuilder(
      stream: bloc.submitValid,
      builder: (context, snapshot) {
        return ContinueButton(
          onPressed: !snapshot.hasData ? null : () {
            bloc.submit(context, args);
          },
        );
      },
    );
  }

  Widget selectedCategory(GoalCategory category) {
    return Container(
      margin: EdgeInsets.only(left: 36, right: 36),
      child: Image.asset(
        'assets/${EnumToString.convertToString(category)}_large.png',
      ),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
    );
  }

  Widget goalDescription(OnboardingScreen3Bloc bloc) {
    return DescriptionField(
      stream: bloc.goalDescription,
      onChanged: bloc.changeGoalDescription,
    );
  }

  Widget doItFor(OnboardingScreen3Bloc bloc) {
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
                child: StreamBuilder(
                  stream: bloc.goalDuration,
                  builder: (context, snapshot) {
                    return DropdownButton(
                      value: snapshot.data,
                      items: GoalDuration.options.map((value) {
                        return DropdownMenuItem(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      icon: Icon(Icons.keyboard_arrow_down_sharp),
                      isExpanded: true,
                      onChanged: (dynamic newValue) => bloc.changeGoalDuration(newValue),
                      underline: Container(),
                    );
                  },
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
