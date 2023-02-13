import 'package:hufi_vnvc_application/models/response_api.dart';
import 'package:hufi_vnvc_application/services/api_services.dart';

class BannerRepository {
  Future<List<String>> getBanners() async {
    var request = APIServices(
        url: "/api/banner/getBanners",
        parse: ((json) {
          var res = ResponseAPI.fromJson(json);

          var list = res.data as List;
          var response = list
              .map(
                (e) => e["image"] as String,
              )
              .toList();
          return response;
        }));
    var banners = await RequestAPI.instance.get(request);
    return banners;
  }
}
