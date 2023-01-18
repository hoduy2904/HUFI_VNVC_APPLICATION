//onClick
//onChange
import 'package:equatable/equatable.dart';

class ProfileEvent extends Equatable {
  @override
  // ignore: todo
  // TODO: implement props
  List<Object?> get props => [];
}

class OnLoadProvince extends ProfileEvent {}

class OnLoadDistrict extends ProfileEvent {
  final int proviceId;
  OnLoadDistrict({required this.proviceId});
  @override
  List<Object?> get props => [proviceId];
}

class OnLoadWard extends ProfileEvent {
  final int districtId;
  OnLoadWard({required this.districtId});
  @override
  List<Object?> get props => [districtId];
}

class OnFullNameChange extends ProfileEvent {
  final String fullName;
  OnFullNameChange({required this.fullName});
  @override
  List<Object?> get props => [fullName];
}

class OnInsuranceCodeChange extends ProfileEvent {
  final String insuranceCode;
  OnInsuranceCodeChange({required this.insuranceCode});
  @override
  List<Object?> get props => [insuranceCode];
}

class OnEmailChange extends ProfileEvent {
  final String email;
  OnEmailChange({required this.email});
  @override
  List<Object?> get props => [email];
}

class OnProviceChange extends ProfileEvent {
  final int? value;
  OnProviceChange({this.value});
  @override
  List<Object?> get props => [value];
}

class OnWardChange extends ProfileEvent {
  final int? value;
  OnWardChange(this.value);
  @override
  List<Object?> get props => [value];
}

class OnDistrictChange extends ProfileEvent {
  final int? value;
  OnDistrictChange(this.value);
  @override
  List<Object?> get props => [value];
}

class OnBirthdayChange extends ProfileEvent {
  final String birthday;
  OnBirthdayChange(this.birthday);
  @override
  List<Object?> get props => [birthday];
}

class OnSexChange extends ProfileEvent {
  final int sex;
  OnSexChange({required this.sex});
  @override
  List<Object?> get props => [sex];
}

class OnIdentityCodeChange extends ProfileEvent {
  final String identityCode;
  OnIdentityCodeChange({required this.identityCode});
  @override
  List<Object?> get props => [identityCode];
}

class OnAddressChange extends ProfileEvent {
  final String address;
  OnAddressChange({required this.address});
  @override
  List<Object?> get props => [address];
}

class onSubmitEvent extends ProfileEvent {
  final bool isValid;
  final bool isSubmit;
  final String? username;
  final String? password;
  onSubmitEvent(
      {this.isValid = false,
      this.isSubmit = false,
      this.username,
      this.password});
  @override
  List<Object?> get props => [isSubmit, isValid];
}
