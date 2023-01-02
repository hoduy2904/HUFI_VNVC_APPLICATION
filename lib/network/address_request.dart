import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_application_1/models/province_model.dart';
import 'package:http/http.dart' as http;

class AddressRequest {
  static List<ProvinceModel> parseProvince(Uint8List resbody) {
    var list = jsonDecode(utf8.decode(resbody)) as List<dynamic>;
    List<ProvinceModel> provinces =
        list.map((e) => ProvinceModel.fromJson(e)).toList();
    return provinces;
  }

  static Future<List<ProvinceModel>> fetchProvince() async {
    Uri url = Uri.parse("https://provinces.open-api.vn/api/?depth=2");
    final response = await http.get(url);
    return parseProvince(response.bodyBytes);
  }
}
