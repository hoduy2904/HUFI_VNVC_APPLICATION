import 'package:hufi_vnvc_application/models/injection_model.dart';
import 'package:hufi_vnvc_application/services/api_services.dart';

class HistoryInjectionRepostitory {
  Future<List<InjectionModel>> getHistoryInjections() async {
    var resource = APIServices(
        url: "/api/getHistoryInjection",
        parse: ((json) {
          var list = json as List;
          return list.map((e) => InjectionModel.fromJson(e)).toList();
        }));
    var response = await RequestAPI().get(resource);
    return response;
  }
}
