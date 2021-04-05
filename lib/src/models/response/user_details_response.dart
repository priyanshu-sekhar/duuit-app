import 'package:duuit/src/models/response/goal_response.dart';
import 'package:json_annotation/json_annotation.dart';
part 'user_details_response.g.dart';

@JsonSerializable(explicitToJson: true)
class UserDetailsResponse {
  final String uId;
  final String name;
  final String bio;
  final List<GoalResponse> goals;

  UserDetailsResponse({required this.uId, required this.name, required this.bio, required this.goals});

  factory UserDetailsResponse.fromJson(Map<String, dynamic> json) => _$FindBuddiesResponseFromJson(json);
  Map<String, dynamic> toJson() => _$FindBuddiesResponseToJson(this);
}