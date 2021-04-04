// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_user_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddUserRequest _$AddUserRequestFromJson(Map<String, dynamic> json) {
  return AddUserRequest(
    uId: json['uId'] as String,
    name: json['name'] as String,
    bio: json['bio'] as String,
  );
}

Map<String, dynamic> _$AddUserRequestToJson(AddUserRequest instance) =>
    <String, dynamic>{
      'uId': instance.uId,
      'name': instance.name,
      'bio': instance.bio,
    };
