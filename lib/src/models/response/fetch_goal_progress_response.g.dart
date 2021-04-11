// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fetch_goal_progress_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FetchGoalProgressResponse _$FetchGoalProgressResponseFromJson(
    Map<String, dynamic> json) {
  return FetchGoalProgressResponse(
    recordedAt: json['recordedAt'] as String,
    status: json['status'] as int,
    journal: JournalResponse.fromJson(json['journal'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$FetchGoalProgressResponseToJson(
        FetchGoalProgressResponse instance) =>
    <String, dynamic>{
      'recordedAt': instance.recordedAt,
      'status': instance.status,
      'journal': instance.journal.toJson(),
    };
