import 'package:json_annotation/json_annotation.dart';
part 'add_goal_request.g.dart';

@JsonSerializable(explicitToJson: true)
class AddGoalRequest {
  final String userId;
  final String name;
  final String description;
  final String duration;
  
  AddGoalRequest({required this.userId, required this.name, required this.description, required this.duration});

  factory AddGoalRequest.fromJson(Map<String, dynamic> json) => _$AddGoalRequestFromJson(json);
  Map<String, dynamic> toJson() => _$AddGoalRequestToJson(this);
}