import 'package:amplify_flutter/amplify.dart';
import 'package:duuit/src/args/user_args.dart';
import 'package:duuit/src/models/access_token.dart';
import 'package:duuit/src/models/app_login_provider.dart';
import 'package:duuit/src/provider/app_auth_provider.dart';
import 'package:duuit/src/screens/onboarding/onboarding_screen_1.dart';
import 'package:duuit/src/widgets/app_title.dart';
import 'package:duuit/src/widgets/logo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final toolbarHeight = MediaQuery.of(context).size.height * 0.4;

    return Scaffold(
      appBar: AppBar(
        title: Container(
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(padding: EdgeInsets.only(top: toolbarHeight - 200)),
              Logo(height: 90),
              Padding(padding: EdgeInsets.only(bottom: 20.0)),
              AppTitle(fontSize: 42.0)
            ],
          ),
        ),
        toolbarHeight: toolbarHeight,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(50.0),
            bottomRight: Radius.circular(50.0),
          ),
        ),
        elevation: 5.0,
      ),
      body: buildLogin(context),
    );
  }

  Widget buildLogin(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(right: 60, left: 60, top: 80),
      child: Column(
        children: [
          buildLoginButton(
              context: context,
              image: 'google.png',
              text: 'Login with Google',
              provider: AppLoginProvider.Google),
          Padding(padding: EdgeInsets.only(bottom: 20)),
          buildLoginButton(
              context: context,
              image: 'fb.png',
              text: 'Login with Facebook',
              provider: AppLoginProvider.Facebook),
        ],
        mainAxisAlignment: MainAxisAlignment.start,
      ),
    );
  }

  Widget buildLoginButton(
      {required BuildContext context,
      required String image,
      required String text,
      required AppLoginProvider provider}) {
    final authBlock = AppAuthProvider.of(context);

    return StreamBuilder(
      stream: authBlock.accessToken,
      builder: (context, AsyncSnapshot<AccessToken> snapshot) {
        authBlock.accessToken.listen((event) {
          Navigator.pushNamed(context, OnboardingScreen1.route,
              arguments: UserArgs(userId: event.userId));
        });

        return ElevatedButton(
          onPressed: () async {
            try {
              authBlock.login(provider);
            } on AmplifyException catch (e) {
              print(e.message);
            }
          },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10))),
            padding:
                MaterialStateProperty.all(EdgeInsets.only(top: 12, bottom: 12)),
          ),
          child: Row(
            children: [
              Image.asset('assets/$image'),
              Padding(padding: EdgeInsets.only(right: 10)),
              Text(
                text,
                style: TextStyle(
                  color: Color(0xFF06172C),
                ),
              )
            ],
            mainAxisAlignment: MainAxisAlignment.center,
          ),
        );
      },
    );
  }
}
