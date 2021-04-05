import 'package:duuit/src/app.dart';
import 'package:duuit/src/models/access_token.dart';
import 'package:duuit/src/resources/resource.dart';
import 'package:flutter/cupertino.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // debugPaintSizeEnabled = true;
  final _resource = Resource();
  AccessToken? accessToken = await _resource.fetchLoginCredentials();

  runApp(
      App(accessToken: accessToken)
  );
}