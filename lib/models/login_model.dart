import 'dart:convert';

import 'package:hufi_vnvc_application/models/user_model.dart';

class LoginModel {
  final String accessToken_Type;
  final String accessToken;
  final String refreshToken;
  final UserModel user;
  LoginModel(
      {required this.accessToken_Type,
      required this.accessToken,
      required this.refreshToken,
      required this.user});

  LoginModel.fromJson(Map<String, dynamic> json)
      : accessToken_Type = json["accessToken_Type"],
        accessToken = json["accessToken"],
        refreshToken = json["refreshToken"],
        user = UserModel.fromJson(json["user"]);
}
