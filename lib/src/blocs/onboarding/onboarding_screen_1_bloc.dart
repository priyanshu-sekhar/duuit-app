import 'package:duuit/src/validators/onboarding/onboarding_screen_1_validators.dart';
import 'package:rxdart/rxdart.dart';

class OnboardingScreen1Bloc with OnboardingScreen1Validators {
  final _userName = BehaviorSubject<String>();
  final _userBio = BehaviorSubject<String>();

  // sinks
  Function(String) get changeUserName => _userName.add;
  Function(String) get changeUserBio => _userBio.add;

  // streams
  Stream<String> get userName => _userName.transform(validateUserName);
  Stream<String> get userBio => _userBio.transform(validateUserBio);
  Stream<bool> get submitValid => CombineLatestStream.combine2(userName, userBio, (a, b) => true);

  dispose() {
    _userName.close();
    _userBio.close();
  }
}
