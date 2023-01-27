import 'package:hufi_vnvc_application/models/district_model.dart';
import 'package:hufi_vnvc_application/models/province_model.dart';
import 'package:hufi_vnvc_application/models/ward_model.dart';
import 'package:hufi_vnvc_application/services/api_services.dart';

class AddressRepository {
  //fetch provinces
  Future<List<ProvinceModel>> getProvinces() async {
    var apiRequest = APIServices(
        url: "",
        fullUrl: "http://provinces.open-api.vn/api/?depth=1",
        parse: (json) {
          var list = json as List;
          return list.map((e) => ProvinceModel.fromJson(e)).toList();
        });
    var request = RequestAPI();
    var response = await request.get(apiRequest);
    return response;
  }

//fetch disticts
  Future<List<DistrictModel>> getDistricts(int provinceId) async {
    var apiRequest = APIServices(
        url: "",
        fullUrl: "http://provinces.open-api.vn/api/p/$provinceId?depth=2",
        parse: ((json) {
          var province = ProvinceModel.fromJson(json);
          return province.districts;
        }));
    var request = RequestAPI();
    return await request.get(apiRequest);
  }

  //fetch wards
  Future<List<WardModel>> getWards(int districtId) async {
    var apiRequest = APIServices(
        url: "",
        fullUrl: "http://provinces.open-api.vn/api/d/$districtId?depth=2",
        parse: ((json) {
          var province = DistrictModel.fromJson(json);
          return province.wards;
        }));
    var request = RequestAPI();
    return await request.get(apiRequest);
  }
}
