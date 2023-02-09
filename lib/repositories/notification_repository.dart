import 'package:hufi_vnvc_application/models/notification_model.dart';
import 'package:hufi_vnvc_application/models/response_api.dart';
import 'package:hufi_vnvc_application/services/api_services.dart';

class NotificationRepository {
  Future<List<NotificationModel>> getNotifications(
      {required int loginId, int page = 1, int pageSize = 10}) async {
    var resource = APIServices(
        url:
            "/api/Notification/getNotifications?loginId=$loginId&page=$page&pageSize=$pageSize",
        parse: ((json) {
          var response = ResponseAPI.fromJson(json);
          var list = response.data as List;
          return list.map((e) => NotificationModel.fromJson(e)).toList();
        }));
    var response = await RequestAPI.instance.get(resource);
    return response;
  }

  Future<ResponseAPI> updateReadNotifications(int id, int loginId) async {
    var body = {'id': id, 'loginId': loginId};
    var resource = APIServices(
        body: body,
        url: "/api/Notification/updateSeenNotification",
        parse: ((json) {
          var response = ResponseAPI.fromJson(json);
          return response;
        }));
    return await RequestAPI.instance.put(resource);
  }
}
