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
  final int? customerTypeId;
  final String password;
  RegisterModel(
      {required this.firstName,
      this.lastName = '',
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
      required this.password,
      this.note,
      this.customerTypeId});

  Map<String, dynamic> toJson() => {
        'firstName': firstName,
        'lastName': lastName,
        'email': email,
        'sex': sex,
        'identityCard': identityCard,
        'avatar': avatar,
        'insuranceCode': insuranceCode,
        'dateOfBirth': dateOfBirth.toIso8601String(),
        'country': country,
        'province': province,
        'district': district,
        'village': village,
        'address': address,
        'phoneNumber': phoneNumber,
        'note': note,
        'customerTypeId': customerTypeId,
        'password': password
      };
}
