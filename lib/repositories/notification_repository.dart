import 'package:hufi_vnvc_application/models/notification_model.dart';
import 'package:hufi_vnvc_application/services/api_services.dart';

class NotificationRepository {
  Future<List<NotificationModel>> getNotifications() async {
    var resource = APIServices(
        url: "/api/getNotifications",
        parse: ((json) {
          var list = json as List;
          return list.map((e) => NotificationModel.fromJson(e)).toList();
        }));
    var response = await RequestAPI().get(resource);
    return response;
  }
}
