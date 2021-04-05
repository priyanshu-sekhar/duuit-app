import 'package:duuit/src/app.dart';
import 'package:duuit/src/models/access_token.dart';
import 'package:duuit/src/models/response/user_details_response.dart';
import 'package:duuit/src/resources/resource.dart';
import 'package:flutter/cupertino.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // debugPaintSizeEnabled = true;
  final _resource = Resource();
  AccessToken? accessToken = await _resource.fetchLoginCredentials();
  UserDetailsResponse? userDetailsResponse = accessToken != null ? await _resource.fetchUserDetails(accessToken) : null;

  runApp(
      App(accessToken: accessToken, userDetailsResponse: userDetailsResponse)
  );
}