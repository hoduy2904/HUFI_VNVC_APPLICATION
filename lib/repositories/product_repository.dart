import 'dart:developer';

import 'package:hufi_vnvc_application/models/response_api.dart';
import 'package:hufi_vnvc_application/models/vaccine_model.dart';
import 'package:hufi_vnvc_application/services/api_services.dart';

class ProductRepository {
  Future<List<VaccineModel>> getVaccines(
      {required int page,
      required int size,
      String? q,
      required int typeOfVaccineId}) async {
    var resource = APIServices(
        url:
            "/api/vaccine/getVaccines/$typeOfVaccineId?page=$page&size=$size${q == null ? "" : ("&q=$q")}",
        parse: ((json) {
          var res = ResponseAPI.fromJson(json);
          var list = res.data as List;
          return list.map((e) => VaccineModel.fromJson(e)).toList();
        }));
    var request = await RequestAPI().get(resource);
    return request;
  }

  Future<VaccineModel> getVaccine(int vaccineId) async {
    var resource = APIServices(
        url: "/api/vaccine/getVaccine/$vaccineId",
        parse: ((json) {
          var res = ResponseAPI.fromJson(json);
          return VaccineModel.fromJson(res.data);
        }));
    var request = await RequestAPI().get(resource);
    return request;
  }
}
