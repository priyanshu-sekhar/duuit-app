import 'package:duuit/src/models/access_token.dart';
import 'package:duuit/src/models/request/add_goal_request.dart';
import 'package:duuit/src/models/request/add_user_request.dart';
import 'package:duuit/src/models/response/user_details_response.dart';
import 'package:duuit/src/resources/api_resource.dart';
import 'package:duuit/src/resources/shared_prefs.dart';

class Resource {
  List<Source> sources = <Source> [
    ApiResource()
  ];
  List<Cache> caches = <Cache>[
    SharedPrefs()
  ];

  addUser(AddUserRequest request) {
    return sources[0].addUser(request);
  }

  addGoal(AddGoalRequest request) {
    return sources[0].addGoal(request);
  }

  Future<List<UserDetailsResponse>> fetchBuddies() {
    return sources[0].fetchBuddies();
  }

  addLoginCredentials(AccessToken accessToken) {
    return caches[0].addLoginCredentials(accessToken);
  }

  Future<AccessToken?> fetchLoginCredentials() {
    return caches[0].fetchLoginCredentials();
  }

  Future<UserDetailsResponse> fetchUserDetails(AccessToken accessToken) {
    return sources[0].fetchUserDetails(accessToken);
  }
}

abstract class Source {
  addUser(AddUserRequest request);
  addGoal(AddGoalRequest request);
  Future<List<UserDetailsResponse>> fetchBuddies();
  Future<UserDetailsResponse> fetchUserDetails(AccessToken accessToken);
}

abstract class Cache {
  addLoginCredentials(AccessToken accessToken);
  Future<AccessToken?> fetchLoginCredentials();
}