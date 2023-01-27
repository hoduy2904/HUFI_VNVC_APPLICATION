import 'package:hufi_vnvc_application/models/injection_schedule.dart';
import 'package:hufi_vnvc_application/models/response_api.dart';
import 'package:hufi_vnvc_application/services/api_services.dart';

class InjectionScheduleRepository {
  Future<InjectionScheduleModel> insertInjectionSchedule(
      InjectionScheduleModel model, int loginId) async {
    var resource = APIServices(
        body: model,
        url: "/api/injectionSchedule/InsertInjectionSchedule?loginId=$loginId",
        parse: ((json) {
          var response = ResponseAPI.fromJson(json);
          var ins = InjectionScheduleModel.fromJson(response.data);
          return ins;
        }));
    return await RequestAPI().post(resource);
  }

  Future<List<InjectionScheduleModel>> getHistoryInjection(
      int customerId) async {
    var resource = APIServices(
        url:
            "/api/InjectionSchedule/GetInjectionSchedules?customerId=$customerId",
        parse: ((json) {
          var request = ResponseAPI.fromJson(json);
          var listResponse = request.data as List;
          return listResponse
              .map((e) => InjectionScheduleModel.fromJson(e))
              .toList();
        }));
    return await RequestAPI().get(resource);
  }
}
