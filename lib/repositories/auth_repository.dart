import 'dart:convert';

import 'package:hufi_vnvc_application/models/auth_model.dart';
import 'package:hufi_vnvc_application/models/register_model.dart';
import 'package:hufi_vnvc_application/models/response_api.dart';
import 'package:hufi_vnvc_application/services/api_services.dart';

class AuthRepository {
  Future<AuthModel> login(String username, String password) async {
    var body = jsonEncode({username, password});
    var resource = APIServices(
        url: "/api/auth/login",
        body: body,
        parse: ((json) {
          var response = json as AuthModel;
          return response;
        }));
    return await RequestAPI().post(resource);
  }

  Future<bool> checkAccountExits(String phoneNumber) async {
    var resource = APIServices(
        url: "/api/Auth/CheckUserExits?phoneNumber=$phoneNumber",
        parse: ((json) {
          print(json);
          var result = json["data"] as bool;
          return result;
        }));
    return await RequestAPI().post(resource);
  }

  Future<ResponseAPI> register(RegisterModel model) async {
    var body = jsonEncode(model);
    var resource = APIServices(
        url: "/api/auth/register",
        parse: ((json) {
          var res = json as ResponseAPI;
          return res;
        }));
    return await RequestAPI().post(resource);
  }
}
