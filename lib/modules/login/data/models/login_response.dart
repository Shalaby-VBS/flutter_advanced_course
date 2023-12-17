import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse {
  String? message;
  @JsonKey(name: 'data')
  UserData? userData;
  bool? status;
  int? code;

  LoginResponse({this.message, this.userData, this.status, this.code});

  factory LoginResponse.fromJson(Map<String, dynamic> json) => _$LoginResponseFromJson(json);
}

@JsonSerializable()
class UserData {
  String? token;
  @JsonKey(name: 'username')
  String? name;

  UserData({this.token, this.name});

  factory UserData.fromJson(Map<String, dynamic> json) => _$UserDataFromJson(json);
}