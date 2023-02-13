import 'package:hufi_vnvc_application/models/cart_model.dart';
import 'package:hufi_vnvc_application/models/response_api.dart';
import 'package:hufi_vnvc_application/services/api_services.dart';

class CartRepository {
  Future<List<CartModel>> getCarts() async {
    var resource = APIServices(
        url: "/api/cart/getCarts",
        parse: ((json) {
          var res = ResponseAPI.fromJson(json);
          //print(res.data);
          var list = res.data as List;
          return list.map((e) => CartModel.fromJson(e)).toList();
        }));
    return await RequestAPI.instance.get(resource);
  }

  Future<ResponseAPI> insertCart({int? vaccineId, int? packageId}) async {
    var body = {
      'vaccineId': vaccineId,
      'packageId': packageId,
    };
    var resource = APIServices(
        url: "/api/cart/insertCart",
        body: body,
        parse: ((json) {
          var res = ResponseAPI.fromJson(json);
          return res;
        }));
    return await RequestAPI.instance.post(resource);
  }

  Future<ResponseAPI> removeCart(int cartId) async {
    var resource = APIServices(
        url: "/api/cart/deleteCart/$cartId",
        parse: ((json) {
          var res = ResponseAPI.fromJson(json);
          return res;
        }));
    return await RequestAPI.instance.delete(resource);
  }
}
