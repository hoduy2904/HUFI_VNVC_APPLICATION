import 'package:hufi_vnvc_application/blocs/profile_bloc/profile_state.dart';

class FormInputStatus extends ProfileState {
  final String fullName;
  String? get validateFullName =>
      fullName.length < 6 ? "Vui lòng nhập hơn 6 ký tự" : null;
  final DateTime? birthday;
  String? get validateBirthday =>
      birthday == null ? "Vui lòng chọn ngày sinh" : null;
  final String insuranceCode;
  String? get validateInsuranceCode =>
      insuranceCode.length < 5 ? "Vui lòng nhập mã thẻ BHYT" : null;
  final String email;
  final String identityCode;
  String? get validateIdentityCode =>
      identityCode.length < 7 ? "Vui lòng nhập CCCD/CMND hợp lệ" : null;
  final String address;
  String? get validateAddress =>
      address.length < 5 ? "Vui lòng nhập địa chỉ hợp lệ" : null;

  final int sex;
  const FormInputStatus(
      {this.identityCode = '',
      this.address = '',
      this.fullName = '',
      this.birthday,
      this.insuranceCode = '',
      this.email = '',
      this.sex = 0});

  FormInputStatus copyFrom(
      {String? fullName,
      DateTime? birthday,
      String? insuranceCode,
      String? email,
      int? sex,
      String? identityCode,
      String? address}) {
    return FormInputStatus(
        fullName: fullName ?? this.fullName,
        birthday: birthday ?? this.birthday,
        insuranceCode: insuranceCode ?? this.insuranceCode,
        email: email ?? this.email,
        sex: sex ?? this.sex,
        identityCode: identityCode ?? this.identityCode,
        address: address ?? this.address);
  }

  bool isValidFormInput() {
    return validateBirthday == null &&
        validateFullName == null &&
        validateAddress == null &&
        validateIdentityCode == null &&
        validateInsuranceCode == null;
  }

  @override
  List<Object?> get props =>
      [fullName, birthday, insuranceCode, email, sex, identityCode, address];
}
