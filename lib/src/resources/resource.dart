import 'package:duuit/src/args/user_args.dart';
import 'package:duuit/src/models/request/add_goal_request.dart';
import 'package:duuit/src/models/request/add_user_request.dart';
import 'package:duuit/src/models/response/find_buddies_response.dart';
import 'package:duuit/src/resources/api_resource.dart';

class Resource {
  List<Source> sources = <Source> [
    ApiResource()
  ];

  addUser(AddUserRequest request) {
    return sources[0].addUser(request);
  }

  addGoal(AddGoalRequest request) {
    return sources[0].addGoal(request);
  }

  Future<List<FindBuddiesResponse>> fetchBuddies() {
    return sources[0].fetchBuddies();
  }
}

abstract class Source {
  addUser(AddUserRequest request);
  addGoal(AddGoalRequest request);
  Future<List<FindBuddiesResponse>> fetchBuddies();
}