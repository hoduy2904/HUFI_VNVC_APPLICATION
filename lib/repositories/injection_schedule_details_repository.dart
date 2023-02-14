import 'package:hufi_vnvc_application/models/injection_schedule_details.dart';
import 'package:hufi_vnvc_application/models/response_api.dart';
import 'package:hufi_vnvc_application/services/api_services.dart';

class InjectionScheduleDetailsRepository {
  Future<ResponseAPI> insertInjectionScheduleDetails(
      InjectionScheduleDetails model, int loginId) async {
    var resource = APIServices(
        body: model,
        url:
            "/api/InjectionScheduleDetail/InsertInjectionScheduleDetailsFromCart?loginId=$loginId",
        parse: ((json) {
          var response = ResponseAPI.fromJson(json);
          return response;
        }));
    return RequestAPI.instance.post(resource);
  }

  Future<List<InjectionScheduleDetails>> getNextInjection(
      int customerId) async {
    var resource = APIServices(
        url: "/api/InjectionScheduleDetail/getNextInjectionDetails/$customerId",
        parse: ((json) {
          var request = ResponseAPI.fromJson(json);
          var listResponse = request.data as List;
          return listResponse
              .map((e) => InjectionScheduleDetails.fromJson(e))
              .toList();
        }));
    return await RequestAPI.instance.get(resource);
  }

  Future<List<InjectionScheduleDetails>> getHistoryInjection(
      int customerId) async {
    var resource = APIServices(
        url:
            "/api/InjectionScheduleDetail/getHistoryInjectionDetails/$customerId",
        parse: ((json) {
          var request = ResponseAPI.fromJson(json);
          var listResponse = request.data as List;
          return listResponse
              .map((e) => InjectionScheduleDetails.fromJson(e))
              .toList();
        }));
    return await RequestAPI.instance.get(resource);
  }

  Future<List<InjectionScheduleDetails>> getInjectionScheduleByFid(
      int injectionScheduleId) async {
    var resource = APIServices(
        url:
            "/api/InjectionScheduleDetail/GetInjectionScheduleDetails/$injectionScheduleId",
        parse: ((json) {
          var request = ResponseAPI.fromJson(json);
          var listResponse = request.data as List;
          return listResponse
              .map((e) => InjectionScheduleDetails.fromJson(e))
              .toList();
        }));
    return await RequestAPI.instance.get(resource);
  }
}
