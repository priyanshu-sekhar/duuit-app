import 'package:duuit/src/args/user_args.dart';
import 'package:duuit/src/models/request/add_goal_request.dart';
import 'package:duuit/src/resources/api_resource.dart';

class Resource {
  List<Source> sources = <Source> [
    ApiResource()
  ];

  addUser(UserArgs args) {
    return sources[0].addUser(args);
  }

  addGoal(AddGoalRequest request) {
    return sources[0].addGoal(request);
  }
}

abstract class Source {
  addUser(UserArgs args);
  addGoal(AddGoalRequest request);
}