import 'package:duuit/src/models/response/goal_response.dart';
import 'package:json_annotation/json_annotation.dart';
part 'find_buddies_response.g.dart';

@JsonSerializable(explicitToJson: true)
class FindBuddiesResponse {
  final String uId;
  final String name;
  final String bio;
  final List<GoalResponse> goals;

  FindBuddiesResponse({required this.uId, required this.name, required this.bio, required this.goals});

  factory FindBuddiesResponse.fromJson(Map<String, dynamic> json) => _$FindBuddiesResponseFromJson(json);
  Map<String, dynamic> toJson() => _$FindBuddiesResponseToJson(this);
}