import 'package:hufi_vnvc_application/models/vaccine_category_model.dart';
import 'package:hufi_vnvc_application/services/api_services.dart';

class CategoryVaccineRepository {
  Future<List<VaccineCategoryModel>> getCategories() async {
    var resource = APIServices(
        url: "/api/getCategories",
        parse: ((json) {
          var list = json as List;
          return list.map((e) => VaccineCategoryModel.fromJson(e)).toList();
        }));
    var response = await RequestAPI().get(resource);
    return response;
  }
}
