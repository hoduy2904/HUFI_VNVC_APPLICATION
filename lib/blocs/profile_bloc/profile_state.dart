//Loading
//Success
//Failed
import 'package:equatable/equatable.dart';
import 'package:hufi_vnvc_application/blocs/profile_bloc/address_status/district_status.dart';
import 'package:hufi_vnvc_application/blocs/profile_bloc/address_status/province_status.dart';
import 'package:hufi_vnvc_application/blocs/profile_bloc/address_status/ward_status.dart';
import 'package:hufi_vnvc_application/blocs/profile_bloc/form_input_status/form_input_status.dart';

enum Status { LOADING, SUCCESS, FAILED }

class ProfileState extends Equatable {
  final ProvinceStatus? provinceStatus;
  final WardStatus? wardStatus;
  final DistrictStatus? districtStatus;
  final FormInputStatus? formInputStatus;
  final ProfileSubmitState? submitState;
  const ProfileState(
      {this.provinceStatus,
      this.wardStatus,
      this.districtStatus,
      this.formInputStatus,
      this.submitState});
  ProfileState copyWith(
      {ProvinceStatus? provinceStatus,
      WardStatus? wardStatus,
      DistrictStatus? districtStatus,
      FormInputStatus? formInputStatus,
      ProfileSubmitState? submitState}) {
    return ProfileState(
        provinceStatus: provinceStatus ?? this.provinceStatus,
        wardStatus: wardStatus ?? this.wardStatus,
        districtStatus: districtStatus ?? this.districtStatus,
        formInputStatus: formInputStatus ?? this.formInputStatus,
        submitState: submitState ?? this.submitState);
  }

  @override
  List<Object?> get props => [
        provinceStatus,
        districtStatus,
        wardStatus,
        formInputStatus,
        submitState
      ];
}

class ProfileErrorState extends ProfileState {
  final String error;
  const ProfileErrorState(this.error);
  @override
  List<Object?> get props => [error];
}

class ProfileSubmitState extends ProfileState {
  final bool isValid;
  final bool submit;
  const ProfileSubmitState({this.submit = false, this.isValid = false});
  List<Object?> get props => [submit, isValid];
}

class ProfileInitialState extends ProfileState {
  const ProfileInitialState(
      {super.provinceStatus,
      super.districtStatus,
      super.formInputStatus,
      super.wardStatus});
}
