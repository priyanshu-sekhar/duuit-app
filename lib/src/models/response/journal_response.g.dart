// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'journal_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JournalResponse _$JournalResponseFromJson(Map<String, dynamic> json) {
  return JournalResponse(
    trackingId: json['trackingId'] as int,
    privacy: json['privacy'] as int,
    text: json['text'] as String,
  );
}

Map<String, dynamic> _$JournalResponseToJson(JournalResponse instance) =>
    <String, dynamic>{
      'trackingId': instance.trackingId,
      'privacy': instance.privacy,
      'text': instance.text,
    };
