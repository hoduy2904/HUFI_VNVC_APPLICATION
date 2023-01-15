import 'package:hufi_vnvc_application/models/cart_model.dart';
import 'package:hufi_vnvc_application/services/api_services.dart';

class CartRepository {
  Future<List<CartModel>> getCarts() async {
    var resource = APIServices(
        url: "/api/getCarts",
        parse: ((json) {
          var list = json as List;
          return list.map((e) => CartModel.fromJson(e)).toList();
        }));
    return await RequestAPI().get(resource);
  }
}
