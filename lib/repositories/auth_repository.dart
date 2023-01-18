import 'dart:convert';

import 'package:hufi_vnvc_application/models/auth_model.dart';
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
}
