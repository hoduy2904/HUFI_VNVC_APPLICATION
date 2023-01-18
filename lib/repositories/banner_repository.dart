import 'package:hufi_vnvc_application/services/api_services.dart';

class BannerRepository {
  Future<List<String>> getBanners() async {
    var request = APIServices(
        url: "/api/banner/getBanners",
        parse: ((json) {
          var list = json["image"] as List<String>;
          return list;
        }));
    var banners = await RequestAPI().get(request);
    return banners;
  }
}
