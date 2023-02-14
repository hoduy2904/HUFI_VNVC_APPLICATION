import 'package:hufi_vnvc_application/constaint.dart';
import 'package:hufi_vnvc_application/models/response_api.dart';
import 'package:hufi_vnvc_application/services/api_services.dart';

class ChatRepository {
  Future<String> sendChat({required String message, String? token}) async {
    var body = {
      "model": "text-davinci-003",
      "prompt": "$message\nAI:",
      "temperature": 0.7,
      "max_tokens": 3888,
      "top_p": 1,
      "frequency_penalty": 0,
      "presence_penalty": 0,
    };
    var resource = APIServices(
        url: "",
        body: body,
        headers: {
          "Content-Type": "application/json",
          "Authorization": token ?? AuthorizationChat
        },
        fullUrl: "https://api.openai.com/v1/completions",
        parse: ((json) {
          var choices = json["choices"][0]["text"].toString();
          return choices;
        }));
    try {
      return await RequestAPI.instance.post(resource);
    } catch (e) {
      return "Hiện tại đang quá tải, vui lòng thử lại sau, xin lỗi vì sự cố này, có vấn đề gì hãy gọi hotline của trung tâm VNVC, xin cảm ơn.";
    }
  }

  Future<ResponseAPI> getChatToken() async {
    var resource = APIServices(
        url: "/api/auth/getChatToken",
        parse: ((json) {
          var response = ResponseAPI.fromJson(json);
          return response;
        }));
    return await RequestAPI().get(resource);
  }
}
