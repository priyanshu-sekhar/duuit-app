import 'package:duuit/src/args/user_args.dart';
import 'package:duuit/src/models/request/add_user_request.dart';
import 'package:duuit/src/resources/resource.dart';
import 'package:duuit/src/screens/onboarding/onboarding_screen_2.dart';
import 'package:duuit/src/validators/onboarding/onboarding_screen_1_validators.dart';
import 'package:flutter/widgets.dart';
import 'package:rxdart/rxdart.dart';

class OnboardingScreen1Bloc with OnboardingScreen1Validators {
  final _resource = Resource();
  final _userName = BehaviorSubject<String>();
  final _userBio = BehaviorSubject<String>();

  // sinks
  Function(String) get changeUserName => _userName.add;

  Function(String) get changeUserBio => _userBio.add;

  // streams
  Stream<String> get userName => _userName.transform(validateUserName);

  Stream<String> get userBio => _userBio.transform(validateUserBio);

  Stream<bool> get submitValid =>
      CombineLatestStream.combine2(userName, userBio, (a, b) => true);

  submit(BuildContext context, UserArgs args) async {
    final newArgs = UserArgs(
        userId: args.userId,
        userName: _userName.value,
        userBio: _userBio.value);
    await _resource.addUser(AddUserRequest(
      uId: newArgs.userId,
      name: newArgs.userName!,
      bio: newArgs.userBio!,
    ));
    Navigator.pushNamed(context, OnboardingScreen2.route, arguments: newArgs);
  }

  dispose() {
    _userName.close();
    _userBio.close();
  }
}
