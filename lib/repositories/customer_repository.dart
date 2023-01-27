import 'dart:convert';

import 'package:hufi_vnvc_application/models/customer_model.dart';
import 'package:hufi_vnvc_application/models/response_api.dart';
import 'package:hufi_vnvc_application/services/api_services.dart';

class CustomerRepository {
  Future<CustomerModel> getCustomerModel(int id) {
    var resource = APIServices(
        url: "/api/customer/GetCustomerByLoginId/$id",
        parse: ((json) {
          var responseAPI = ResponseAPI.fromJson(json);
          var customer = CustomerModel.fromJson((responseAPI.data));
          return customer;
        }));
    return RequestAPI().get(resource);
  }
}
