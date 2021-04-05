import 'package:duuit/src/models/access_token.dart';
import 'package:duuit/src/resources/resource.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs implements Cache {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  addLoginCredentials(AccessToken accessToken) async {
    final SharedPreferences prefs = await _prefs;

    prefs.setString('userId', accessToken.userId);
  }

  Future<AccessToken?> fetchLoginCredentials() async {
    final SharedPreferences prefs = await _prefs;
    String? userId = prefs.getString('userId');

    if (userId != null)
      return AccessToken(userId: userId);

    return null;
  }
}