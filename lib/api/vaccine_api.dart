import 'dart:convert';

import 'package:hufi_vnvc_application/api/base_api.dart';
import 'package:hufi_vnvc_application/models/vaccine_model.dart';

import 'package:http/http.dart' as http;

class VaccineAPI extends BaseAPI {
  Future<List<VaccineModel>?> getVaccines() async {
    var url = Uri.parse("$baseUrl/api/vaccine/GetVaccines");
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      return vaccineFromJson(jsonEncode(json["data"]));
    }
  }
}
