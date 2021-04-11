import 'package:json_annotation/json_annotation.dart';
part 'fetch_user_progress_request.g.dart';

@JsonSerializable(explicitToJson: true)
class FetchUserProgressRequest {
  final int month;
  final int year;

  FetchUserProgressRequest({required this.month, required this.year});

  factory FetchUserProgressRequest.fromJson(Map<String, dynamic> json) => _$FetchUserProgressRequestFromJson(json);
  Map<String, dynamic> toJson() => _$FetchUserProgressRequestToJson(this);
}