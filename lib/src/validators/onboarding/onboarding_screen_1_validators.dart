import 'dart:async';

class OnboardingScreen1Validators {
  final validateUserName = StreamTransformer<String, String>.fromHandlers(
    handleData: (userName, sink) {
      if (userName.length >= 3) {
        sink.add(userName);
      } else {
        sink.addError('UserName must be atleast 3 characters');
      }
    }
  );
  
  final validateUserBio = StreamTransformer<String, String>.fromHandlers(
    handleData: (userBio, sink) {
      if (userBio.length >= 20) {
        sink.add(userBio);
      } else {
        sink.addError('Description must be atleast 20 characters');
      }
    }
  );
}