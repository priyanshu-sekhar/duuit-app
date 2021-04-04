import 'package:duuit/src/args/user_args.dart';
import 'package:duuit/src/resources/api_resource.dart';

class Resource {
  List<Source> sources = <Source> [
    ApiResource()
  ];

  addUser(UserArgs args) {
    return sources[0].addUser(args);
  }
}

abstract class Source {
  addUser(UserArgs args);
}