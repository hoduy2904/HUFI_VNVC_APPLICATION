class RegisterModel {
  final String firstName;
  final String lastName;
  final String? email;
  final bool sex;
  final String identityCard;
  final String? avatar;
  final String? insuranceCode;
  final DateTime dateOfBirth;
  final String country;
  final String province;
  final String district;
  final String village;
  final String address;
  final String phoneNumber;
  final String? note;
  final int customerTypeId;
  RegisterModel(
      {required this.firstName,
      required this.lastName,
      this.email,
      required this.sex,
      required this.identityCard,
      this.avatar,
      this.insuranceCode,
      required this.dateOfBirth,
      required this.country,
      required this.province,
      required this.district,
      required this.village,
      required this.address,
      required this.phoneNumber,
      this.note,
      required this.customerTypeId});
}
