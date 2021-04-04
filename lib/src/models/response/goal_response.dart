import 'package:json_annotation/json_annotation.dart';
part 'goal_response.g.dart';

@JsonSerializable(explicitToJson: true)
class GoalResponse {
  @JsonKey(name: "ID")
  final int id;
  final String userId;
  final String name;
  final String duration;
  final String description;

  GoalResponse({required this.id, required this.userId, required this.name, required this.duration, required this.description});

  factory GoalResponse.fromJson(Map<String, dynamic> json) => _$GoalResponseFromJson(json);
  Map<String, dynamic> toJson() => _$GoalResponseToJson(this);
}