import 'package:json_annotation/json_annotation.dart';
part 'add_goal_progress_request.g.dart';

@JsonSerializable(explicitToJson: true)
class AddGoalProgressRequest {
  final String recordedAt;
  final String status;

  AddGoalProgressRequest({required this.recordedAt, required this.status});

  factory AddGoalProgressRequest.fromJson(Map<String, dynamic> json) => _$AddGoalProgressRequestFromJson(json);
  Map<String, dynamic> toJson() => _$AddGoalProgressRequestToJson(this);
}