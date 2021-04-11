import 'dart:convert';
import 'package:duuit/src/models/access_token.dart';
import 'package:duuit/src/models/request/add_goal_progress_request.dart';
import 'package:duuit/src/models/request/add_goal_request.dart';
import 'package:duuit/src/models/request/add_user_request.dart';
import 'package:duuit/src/models/request/fetch_user_progress_request.dart';
import 'package:duuit/src/models/response/fetch_goal_progress_response.dart';
import 'package:duuit/src/models/response/user_details_response.dart';
import 'package:duuit/src/resources/resource.dart';
import 'package:http/http.dart';

final _root = 'www.duuit.io';
final _rootLocal = 'localhost:5000';

class ApiResource implements Source {
  Client client = Client();

  addUser(AddUserRequest request) async {
    final response = await client.post(
      Uri.https(_root, '/v2/user'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(request),
    );
  }

  addGoal(AddGoalRequest request) async {
    await client.post(
      Uri.https(_root, '/v2/goal'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(request)
    );
  }

  Future<UserDetailsResponse> fetchUserDetails(String userId) async {
    final response = await client.get(
      Uri.https(_root, '/v2/user/$userId'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      }
    );

    return UserDetailsResponse.fromJson(jsonDecode(response.body));
  }

  Future<List<UserDetailsResponse>> fetchBuddies() async {
    final response = await client.get(
      Uri.https(_root, '/v2/user/all'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    List<UserDetailsResponse> buddies = [];
    if (response.statusCode == 200) {
      Iterable l = jsonDecode(response.body);
      buddies = List<UserDetailsResponse>.from(l.map((item) => UserDetailsResponse.fromJson(item)));
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }

    return buddies;
  }

  Future<List<FetchGoalProgressResponse>>  fetchUserProgress(int goalId, FetchUserProgressRequest request) async {
    final response = await client.post(
      Uri.http(_rootLocal, '/v2/goal/$goalId/progress'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(request),
    );
    
    return parseProgressResponse(response);
  }

  Future<List<FetchGoalProgressResponse>> fetchUserRecentProgress(int goalId) async {
    final response = await client.get(
      Uri.http(_rootLocal, '/v2/goal/$goalId/progress/recent'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    
    return parseProgressResponse(response);
  }

  List<FetchGoalProgressResponse> parseProgressResponse(Response response) {
    List<FetchGoalProgressResponse> recentProgress = [];
    if (response.statusCode == 200) {
      Iterable l = jsonDecode(response.body);
      recentProgress = List<FetchGoalProgressResponse>.from(l.map((item) => FetchGoalProgressResponse.fromJson(item)));
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
    
    return recentProgress;
  }
  
  addUserProgress(int goalId, AddGoalProgressRequest request) async {
    final response = await client.post(
      Uri.http(_rootLocal, '/v2/goal/$goalId/progress/add'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(request)
    );
  }
}