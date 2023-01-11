import 'package:hufi_vnvc_application/blocs/profile_bloc/profile_state.dart';

class FormInputStatus extends ProfileState {
  final String? fullName;
  String? get validateFullName =>
      fullName!.length < 6 ? "Vui lòng nhập hơn 6 ký tự" : null;
  final String? birthday;
  String? get validateBirthday =>
      birthday == null ? "Vui lòng chọn ngày sinh" : null;
  final String? insuranceCode;
  final String? email;

  final int? sex;
  const FormInputStatus(
      {this.fullName, this.birthday, this.insuranceCode, this.email, this.sex});

  FormInputStatus copyFrom(
      {String? fullName,
      String? birthday,
      String? insuranceCode,
      String? email,
      int? sex}) {
    return FormInputStatus(
        fullName: fullName ?? this.fullName,
        birthday: birthday ?? this.birthday,
        insuranceCode: insuranceCode ?? this.insuranceCode,
        email: email ?? this.email,
        sex: sex ?? this.sex);
  }

  @override
  List<Object?> get props => [fullName, birthday, insuranceCode, email, sex];
}
