import 'package:duuit/src/models/access_token.dart';
import 'package:duuit/src/models/response/user_details_response.dart';
import 'package:duuit/src/resources/resource.dart';
import 'package:rxdart/rxdart.dart';

class UserBloc {
  final _resource = Resource();
  final _userDetails = BehaviorSubject<UserDetailsResponse>();

  Stream<UserDetailsResponse> get userDetails => _userDetails.stream;

  fetchUserDetails(UserDetailsResponse? userDetailsResponse) async {
    if (userDetailsResponse != null)
      _userDetails.add(userDetailsResponse);
    else {
      AccessToken? accessToken = await _resource.fetchLoginCredentials();
      UserDetailsResponse response = await _resource.fetchUserDetails(accessToken!.userId);
      _userDetails.add(response);
    }
  }

  dispose() {
    _userDetails.close();
  }

}