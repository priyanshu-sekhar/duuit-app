import 'package:duuit/src/args/onboarding/onboarding_screen_3_args.dart';
import 'package:duuit/src/args/user_args.dart';
import 'package:duuit/src/models/goal_durations.dart';
import 'package:duuit/src/screens/onboarding/onboarding_screen_4.dart';
import 'package:duuit/src/validators/onboarding/onboarding_screen_3_validators.dart';
import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';

class OnboardingScreen3Bloc extends OnboardingScreen3Validators {
  final _goalDescription = BehaviorSubject<String>();
  final _goalDuration = BehaviorSubject<String>.seeded(GoalDuration.options[0]);

  Function(String) get changeGoalDescription => _goalDescription.add;

  Function(String) get changeGoalDuration => _goalDuration.add;

  Stream<String> get goalDescription =>
      _goalDescription.transform(validateGoalDescription);

  Stream<String> get goalDuration => _goalDuration;

  Stream<bool> get submitValid =>
      CombineLatestStream([goalDescription, goalDuration], (values) => true);

  submit(BuildContext context, OnboardingScreen3Args args) {
    Navigator.pushNamed(context, OnboardingScreen4.route,
        arguments: OnboardingScreen3Args(
          userId: args.userId,
          userName: args.userName,
          userBio: args.userBio,
          goalCategory: args.goalCategory,
          goalDuration: _goalDuration.value,
          goalDescription: _goalDescription.value
        ));
  }

  dispose() {
    _goalDescription.close();
    _goalDuration.close();
  }
}
