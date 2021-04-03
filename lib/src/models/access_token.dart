import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AccessToken {
  final String? token;
  final String userId;

  AccessToken.fromFBSignIn(FacebookAccessToken accessToken)
      : token = accessToken.token,
        userId = accessToken.userId;

  AccessToken.fromGoogleSignIn(GoogleSignInAccount account)
      : token = null,
        userId = account.id;
}