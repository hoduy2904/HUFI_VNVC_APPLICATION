import 'package:hufi_vnvc_application/models/vaccine_model.dart';
import 'package:hufi_vnvc_application/services/api_services.dart';

class ProductRepository {
  Future<List<VaccineModel>> getVaccines(
      {required int page, required int size, String? q}) async {
    var resource = APIServices(
        url:
            "/api/getVaccines?page=$page&size=$size${q == null ? "" : ("&q=$q")}",
        parse: ((json) {
          var list = json as List;
          return list.map((e) => VaccineModel.fromJson(e)).toList();
        }));
    var request = await RequestAPI().get(resource);
    return request;
  }

  Future<VaccineModel> getVaccine(int vaccineId) async {
    var resource = APIServices(
        url: "api/getVaccine/$vaccineId",
        parse: ((json) {
          return json as VaccineModel;
        }));
    var request = await RequestAPI().get(resource);
    return request;
  }
}
