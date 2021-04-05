// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_details_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserDetailsResponse _$FindBuddiesResponseFromJson(Map<String, dynamic> json) {
  return UserDetailsResponse(
    uId: json['uId'] as String,
    name: json['name'] as String,
    bio: json['bio'] as String,
    goals: (json['goals'] as List<dynamic>)
        .map((e) => GoalResponse.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$FindBuddiesResponseToJson(
        UserDetailsResponse instance) =>
    <String, dynamic>{
      'uId': instance.uId,
      'name': instance.name,
      'bio': instance.bio,
      'goals': instance.goals.map((e) => e.toJson()).toList(),
    };
