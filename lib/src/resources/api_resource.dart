import 'dart:convert';
import 'package:duuit/src/args/user_args.dart';
import 'package:duuit/src/models/request/add_goal_request.dart';
import 'package:duuit/src/models/request/add_user_request.dart';
import 'package:duuit/src/models/response/find_buddies_response.dart';
import 'package:duuit/src/resources/resource.dart';
import 'package:http/http.dart';

// final _root = 'duuit.io/v2/';
final _root = 'localhost:5000';

class ApiResource implements Source {
  Client client = Client();

  addUser(AddUserRequest request) async {
    final response = await client.post(
      Uri.http(_root, '/v2/user'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(request),
    );
  }

  addGoal(AddGoalRequest request) async {
    await client.post(
      Uri.http(_root, '/v2/goal'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(request)
    );
  }

  Future<List<FindBuddiesResponse>> fetchBuddies() async {
    final response = await client.get(
      Uri.http(_root, '/v2/user/all'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    List<FindBuddiesResponse> buddies = [];
    if (response.statusCode == 200) {
      Iterable l = jsonDecode(response.body);
      buddies = List<FindBuddiesResponse>.from(l.map((item) => FindBuddiesResponse.fromJson(item)));
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }

    return buddies;
  }
}