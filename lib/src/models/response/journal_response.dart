import 'package:json_annotation/json_annotation.dart';
part 'journal_response.g.dart';

@JsonSerializable(explicitToJson: true)
class JournalResponse {
  final int trackingId;
  final int privacy;
  final String text;

  JournalResponse({required this.trackingId, required this.privacy, required this.text});

  factory JournalResponse.fromJson(Map<String, dynamic> json) => _$JournalResponseFromJson(json);
  Map<String, dynamic> toJson() => _$JournalResponseToJson(this);
}