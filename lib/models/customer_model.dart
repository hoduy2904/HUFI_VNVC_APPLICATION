class CustomerModel {
  final int id;
  final String firstName;
  final String lastName;
  final String? email;
  final bool sex;
  final String? identityCard;
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
  final List<CustomerModel> customerLink;
  CustomerModel(
      {required this.id,
      required this.firstName,
      required this.lastName,
      required this.email,
      required this.sex,
      this.identityCard,
      required this.address,
      this.avatar,
      this.insuranceCode,
      required this.dateOfBirth,
      required this.country,
      required this.province,
      required this.district,
      required this.village,
      required this.phoneNumber,
      this.note,
      this.customerTypeId,
      this.customerLink = const []});

  factory CustomerModel.fromJson(Map<String, dynamic> json) {
    List<CustomerModel> customerLink = [];
    if (json["customerLink"] != null) {
      customerLink = (json["customerLink"] as List)
          .map((e) => CustomerModel.fromJson(e))
          .toList();
    }
    return CustomerModel(
        id: json["id"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        email: json["email"],
        sex: json["sex"],
        identityCard: json["identityCard"],
        avatar: json["avatar"],
        insuranceCode: json["insuranceCode"],
        dateOfBirth: DateTime.parse(json["dateOfBirth"]),
        country: json["country"],
        province: json["province"],
        district: json["district"],
        village: json["village"],
        address: json["address"],
        phoneNumber: json["phoneNumber"],
        note: json["note"],
        customerTypeId: json["customerTypeId"],
        customerLink: customerLink);
  }
}
