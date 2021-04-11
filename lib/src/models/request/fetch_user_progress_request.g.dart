// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fetch_user_progress_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FetchUserProgressRequest _$FetchUserProgressRequestFromJson(
    Map<String, dynamic> json) {
  return FetchUserProgressRequest(
    month: json['month'] as int,
    year: json['year'] as int,
  );
}

Map<String, dynamic> _$FetchUserProgressRequestToJson(
        FetchUserProgressRequest instance) =>
    <String, dynamic>{
      'month': instance.month,
      'year': instance.year,
    };
