import 'package:duuit/src/models/response/find_buddies_response.dart';
import 'package:duuit/src/resources/resource.dart';
import 'package:duuit/src/validators/onboarding/onboarding_screen_5_validators.dart';
import 'package:rxdart/rxdart.dart';

class OnboardingScreen5Bloc with OnboardingScreen5Validators {
  final _resource = Resource();
  final _buddies = PublishSubject<List<FindBuddiesResponse>>();

  Stream<List<FindBuddiesResponse>> get buddies => _buddies.stream;

  fetchBuddies() async {
    final buddies = await _resource.fetchBuddies();
    _buddies.add(buddies);
  }

  dispose() {
    _buddies.close();
  }
}