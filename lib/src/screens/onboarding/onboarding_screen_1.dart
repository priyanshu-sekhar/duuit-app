import 'package:duuit/src/args/user_args.dart';
import 'package:duuit/src/blocs/onboarding/onboarding_screen_1_bloc.dart';
import 'package:duuit/src/models/access_token.dart';
import 'package:duuit/src/widgets/continue_button.dart';
import 'package:duuit/src/widgets/header.dart';
import 'package:duuit/src/widgets/onboarding_header.dart';
import 'package:duuit/src/widgets/profile_pic.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OnboardingScreen1 extends StatelessWidget {
  static const String route = '/onboarding/1';
  final AccessToken? accessToken;

  OnboardingScreen1({this.accessToken});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: Header(),
        body: Container(
          child: Stack(
            children: [OnboardingHeader(), onboardingSection(context)],
          ),
        ));
  }

  Widget onboardingSection(BuildContext context) {
    final OnboardingScreen1Bloc bloc =
        Provider.of<OnboardingScreen1Bloc>(context);
    UserArgs userArgs = fetchArgs(context);

    return Container(
      margin: EdgeInsets.only(left: 60, right: 60),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(padding: EdgeInsets.only(top: 70)),
          ProfilePic(),
          Padding(padding: EdgeInsets.only(top: 36)),
          userName(bloc),
          Padding(padding: EdgeInsets.only(bottom: 15)),
          userBio(bloc),
          Padding(padding: EdgeInsets.only(bottom: 42)),
          submit(bloc, userArgs),
          Padding(padding: EdgeInsets.only(bottom: 48)),
          Image.asset(
            'assets/g1.jpg',
          )
        ],
      ),
      // color: Colors.orange,
    );
  }

  UserArgs fetchArgs(BuildContext context) {
    UserArgs userArgs = accessToken != null
        ? UserArgs(userId: accessToken!.userId)
        : ModalRoute.of(context)!.settings.arguments as UserArgs;
    return userArgs;
  }

  Widget submit(OnboardingScreen1Bloc bloc, UserArgs args) {
    return StreamBuilder(
      stream: bloc.submitValid,
      builder: (context, snapshot) {
        return ContinueButton(
          onPressed: !snapshot.hasData
              ? null
              : () {
                  bloc.submit(context, args);
                },
        );
      },
    );
  }

  Widget userName(OnboardingScreen1Bloc bloc) {
    return Container(
      height: 40,
      child: StreamBuilder(
        stream: bloc.userName,
        builder: (context, AsyncSnapshot<String> snapshot) {
          return TextField(
            decoration: textFieldDecoration(
              hintText: 'Choose a cool username',
              errorText: snapshot.error,
            ),
            onChanged: bloc.changeUserName,
          );
        },
      ),
    );
  }

  Widget userBio(OnboardingScreen1Bloc bloc) {
    return Container(
      height: 144,
      child: StreamBuilder(
        stream: bloc.userBio,
        builder: (context, AsyncSnapshot<String> snapshot) {
          return TextField(
            minLines: 10,
            maxLines: 10,
            decoration: textFieldDecoration(
              hintText: 'Write about yourself',
              errorText: snapshot.error,
            ),
            onChanged: bloc.changeUserBio,
          );
        },
      ),
    );
  }

  InputDecoration textFieldDecoration({String? hintText, errorText}) {
    return InputDecoration(
      contentPadding: EdgeInsets.all(10),
      focusedBorder: textFieldBorder(),
      enabledBorder: textFieldBorder(),
      hintText: hintText,
      hintStyle: TextStyle(
        fontSize: 14.0,
        fontWeight: FontWeight.w400,
      ),
      errorText: errorText,
    );
  }

  OutlineInputBorder textFieldBorder() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Colors.black45));
  }
}
