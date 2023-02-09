import 'package:hufi_vnvc_application/constaint.dart';
import 'package:hufi_vnvc_application/services/api_services.dart';

class ChatRepository {
  Future<String> sendChat(String message) async {
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
          "Authorization": AuthorizationChat
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
}
