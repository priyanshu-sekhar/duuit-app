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
        title: Column(
          children: [
            Padding(padding: EdgeInsets.only(top: toolbarHeight - 200)),
            Logo(height: 90),
            Padding(padding: EdgeInsets.only(bottom: 20.0)),
            AppTitle(fontSize: 42.0)
          ],
        ),
        toolbarHeight: toolbarHeight,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50.0),
                bottomRight: Radius.circular(50.0))),
        elevation: 5.0,
      ),
    );
  }
}
