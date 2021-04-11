// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_goal_progress_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddGoalProgressRequest _$AddGoalProgressRequestFromJson(
    Map<String, dynamic> json) {
  return AddGoalProgressRequest(
    recordedAt: json['recordedAt'] as String,
    status: json['status'] as String,
  );
}

Map<String, dynamic> _$AddGoalProgressRequestToJson(
        AddGoalProgressRequest instance) =>
    <String, dynamic>{
      'recordedAt': instance.recordedAt,
      'status': instance.status,
    };
