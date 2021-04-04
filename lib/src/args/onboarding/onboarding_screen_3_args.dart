import 'package:duuit/src/models/goal_category.dart';

class OnboardingScreen3Args {
  final String userId;
  final String userName;
  final String userBio;
  final GoalCategory goalCategory;
  final String? goalDescription;
  final String? goalDuration;

  OnboardingScreen3Args({
    required this.userId,
    required this.userName,
    required this.userBio,
    required this.goalCategory,
    this.goalDescription,
    this.goalDuration
  });
}
