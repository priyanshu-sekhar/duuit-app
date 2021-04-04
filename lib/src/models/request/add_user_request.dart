import 'package:json_annotation/json_annotation.dart';
part 'add_user_request.g.dart';

@JsonSerializable(explicitToJson: true)
class AddUserRequest {
  final String uId;
  final String name;
  final String bio;

  AddUserRequest({required this.uId, required this.name, required this.bio});

  factory AddUserRequest.fromJson(Map<String, dynamic> json) => _$AddUserRequestFromJson(json);
  Map<String, dynamic> toJson() => _$AddUserRequestToJson(this);
}