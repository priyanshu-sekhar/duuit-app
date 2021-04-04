// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'goal_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GoalResponse _$GoalResponseFromJson(Map<String, dynamic> json) {
  return GoalResponse(
    id: json['ID'] as int,
    userId: json['userId'] as String,
    name: json['name'] as String,
    duration: json['duration'] as String,
    description: json['description'] as String,
  );
}

Map<String, dynamic> _$GoalResponseToJson(GoalResponse instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'userId': instance.userId,
      'name': instance.name,
      'duration': instance.duration,
      'description': instance.description,
    };
