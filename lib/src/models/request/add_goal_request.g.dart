// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_goal_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddGoalRequest _$AddGoalRequestFromJson(Map<String, dynamic> json) {
  return AddGoalRequest(
    userId: json['userId'] as String,
    name: json['name'] as String,
    description: json['description'] as String,
    duration: json['duration'] as String,
  );
}

Map<String, dynamic> _$AddGoalRequestToJson(AddGoalRequest instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'name': instance.name,
      'description': instance.description,
      'duration': instance.duration,
    };
