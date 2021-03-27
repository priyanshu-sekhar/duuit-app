import 'package:duuit/src/blocs/auth_bloc.dart';
import 'package:duuit/src/provider/auth_provider.dart';
import 'package:duuit/src/widgets/app_title.dart';
import 'package:duuit/src/widgets/logo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = AuthProvider.of(context);
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
      body: buildLogin(context, bloc),
    );
  }

  Widget buildLogin(BuildContext context, AuthBloc bloc) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(right: 60, left: 60, top: 80),
      child: Column(
        children: [
          buildLoginButton(context, 'google.png', 'Login with Google'),
          Padding(padding: EdgeInsets.only(bottom: 20)),
          buildLoginButton(context, 'fb.png', 'Login with Facebook')
        ],
        mainAxisAlignment: MainAxisAlignment.start,
      ),
    );
  }

  Widget buildLoginButton(BuildContext context, String image, String text) {
    return ElevatedButton(
      onPressed: () {
        Navigator.pushNamed(context, '/onboarding/1');
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
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
  }
}
