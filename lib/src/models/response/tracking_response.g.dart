// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tracking_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrackingResponse _$TrackingResponseFromJson(Map<String, dynamic> json) {
  return TrackingResponse(
    day: json['day'] as String,
    done: json['done'] as bool,
    journalId: json['journalId'] as int,
    past: json['past'] as bool,
  );
}

Map<String, dynamic> _$TrackingResponseToJson(TrackingResponse instance) =>
    <String, dynamic>{
      'day': instance.day,
      'done': instance.done,
      'journalId': instance.journalId,
      'past': instance.past,
    };
