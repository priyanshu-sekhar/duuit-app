import 'package:duuit/src/models/response/journal_response.dart';
import 'package:json_annotation/json_annotation.dart';
part 'fetch_goal_progress_response.g.dart';

@JsonSerializable(explicitToJson: true)
class FetchGoalProgressResponse {
  final String recordedAt;
  final int status;
  final JournalResponse journal;

  FetchGoalProgressResponse({required this.recordedAt, required this.status, required this.journal});

  factory FetchGoalProgressResponse.fromJson(Map<String, dynamic> json) => _$FetchGoalProgressResponseFromJson(json);
  Map<String, dynamic> toJson() => _$FetchGoalProgressResponseToJson(this);
}