import 'package:flutter_facebook_login/flutter_facebook_login.dart';

class AccessToken {
  final String token;
  final String userId;

  AccessToken.fromFBAccessToken(FacebookAccessToken accessToken)
      : token = accessToken.token,
        userId = accessToken.userId;

}