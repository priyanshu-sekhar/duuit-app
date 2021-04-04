import 'dart:async';

class OnboardingScreen3Validators {
  final validateGoalDescription = StreamTransformer<String, String>.fromHandlers(
    handleData: (goalDescription, sink) {
      if (goalDescription.length >= 10) {
        sink.add(goalDescription);
      } else {
        sink.addError('Description must be atleast 10 characters');
      }
    }
  );
}