import 'dart:io';
import 'package:hufi_vnvc_application/models/response_api.dart';
import 'package:hufi_vnvc_application/services/api_services.dart';

class GeneralRepository {
  Future<ResponseAPI> uploadImage(File image) async {
    var resource = await RequestAPI.instance.postFile(file: image);
    return resource;
  }
}
