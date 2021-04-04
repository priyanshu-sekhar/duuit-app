import 'package:duuit/src/args/onboarding/onboarding_screen_3_args.dart';
import 'package:duuit/src/args/user_args.dart';
import 'package:duuit/src/models/goal_durations.dart';
import 'package:duuit/src/models/request/add_goal_request.dart';
import 'package:duuit/src/resources/resource.dart';
import 'package:duuit/src/screens/onboarding/onboarding_screen_4.dart';
import 'package:duuit/src/validators/onboarding/onboarding_screen_3_validators.dart';
import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';

class OnboardingScreen3Bloc extends OnboardingScreen3Validators {
  final _resource = Resource();
  final _goalDescription = BehaviorSubject<String>();
  final _goalDuration = BehaviorSubject<String>.seeded(GoalDuration.options[0]);

  Function(String) get changeGoalDescription => _goalDescription.add;

  Function(String) get changeGoalDuration => _goalDuration.add;

  Stream<String> get goalDescription =>
      _goalDescription.transform(validateGoalDescription);

  Stream<String> get goalDuration => _goalDuration;

  Stream<bool> get submitValid =>
      CombineLatestStream([goalDescription, goalDuration], (values) => true);

  submit(BuildContext context, OnboardingScreen3Args args) async {
    OnboardingScreen3Args newArgs = OnboardingScreen3Args(
        userId: args.userId,
        userName: args.userName,
        userBio: args.userBio,
        goalCategory: args.goalCategory,
        goalDuration: _goalDuration.value,
        goalDescription: _goalDescription.value
    );

    await _resource.addGoal(AddGoalRequest(
      userId: newArgs.userId,
      name: EnumToString.convertToString(newArgs.goalCategory),
      description: newArgs.goalDescription!,
      duration: newArgs.goalDescription!
    ));

    Navigator.pushNamed(context, OnboardingScreen4.route,
        arguments: newArgs);
  }

  dispose() {
    _goalDescription.close();
    _goalDuration.close();
  }
}
