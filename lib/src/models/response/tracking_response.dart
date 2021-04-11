import 'package:json_annotation/json_annotation.dart';
part 'tracking_response.g.dart';

@JsonSerializable(explicitToJson: true)
class TrackingResponse {
  final String day;
  final bool done;
  final int journalId;
  final bool past;

  TrackingResponse({required this.day, required this.done, required this.journalId, required this.past});

  factory TrackingResponse.fromJson(Map<String, dynamic> json) => _$TrackingResponseFromJson(json);
  Map<String, dynamic> toJson() => _$TrackingResponseToJson(this);
}