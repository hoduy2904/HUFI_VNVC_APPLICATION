import 'package:hufi_vnvc_application/models/response_api.dart';
import 'package:hufi_vnvc_application/models/vaccine_category_model.dart';
import 'package:hufi_vnvc_application/services/api_services.dart';

class CategoryVaccineRepository {
  Future<List<VaccineCategoryModel>> getCategories() async {
    var resource = APIServices(
        url: "/api/typeofvaccine/gettypeofvaccines",
        parse: ((json) {
          var res = ResponseAPI.fromJson(json);
          var list = res.data as List;
          return list.map((e) => VaccineCategoryModel.fromJson(e)).toList();
        }));
    var response = await RequestAPI.instance.get(resource);
    return response;
  }
}
