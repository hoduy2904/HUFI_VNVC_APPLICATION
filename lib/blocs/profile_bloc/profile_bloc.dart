import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hufi_vnvc_application/blocs/profile_bloc/form_input_status/form_input_status.dart';
import 'package:hufi_vnvc_application/blocs/profile_bloc/profile_event.dart';
import 'package:hufi_vnvc_application/blocs/profile_bloc/profile_state.dart';
import 'package:hufi_vnvc_application/blocs/profile_bloc/address_status/district_status.dart';
import 'package:hufi_vnvc_application/blocs/profile_bloc/address_status/province_status.dart';
import 'package:hufi_vnvc_application/blocs/profile_bloc/address_status/ward_status.dart';
import 'package:hufi_vnvc_application/models/register_model.dart';
import 'package:hufi_vnvc_application/repositories/address_repository.dart';
import 'package:hufi_vnvc_application/repositories/auth_repository.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc()
      : super(const ProfileInitialState(formInputStatus: FormInputStatus())) {
    //Loading State Provinces
    on<OnLoadProvince>((event, emit) async {
      emit(state.copyWith(provinceStatus: const ProvinceStatus()));
      try {
        print("have");
        var provinces = await AddressRepository().getProvinces();
        emit(state.copyWith(
          provinceStatus:
              ProvinceStatus(provinces: provinces, status: Status.SUCCESS),
        ));
      } catch (e) {
        emit(state.copyWith(
          provinceStatus: const ProvinceStatus(
              status: Status.FAILED, message: "Failed to load provinces"),
        ));
      }
    });
    on<OnProviceChange>((event, emit) async {
      var districts = await AddressRepository().getDistricts(event.value!);
      emit(state.copyWith(
          provinceStatus:
              state.provinceStatus?.copyFrom(codeSelect: event.value),
          districtStatus:
              DistrictStatus(status: Status.SUCCESS, districts: districts),
          wardStatus: const WardStatus(status: Status.SUCCESS)));
    });

    on<OnDistrictChange>((event, emit) async {
      var wards = await AddressRepository().getWards(event.value!);
      emit(state.copyWith(
          districtStatus:
              state.districtStatus?.copyFrom(codeSelect: event.value),
          wardStatus: WardStatus(status: Status.SUCCESS, wards: wards)));
    });

    on<OnWardChange>((event, emit) async {
      emit(state.copyWith(
          wardStatus: state.wardStatus?.copyFrom(codeSelect: event.value)));
    });
    //Loading State Districts
    on<OnLoadDistrict>((event, emit) async {
      emit(state.copyWith(districtStatus: const DistrictStatus()));
      try {
        var districts = await AddressRepository().getDistricts(event.proviceId);
        emit(state.copyWith(
            wardStatus: const WardStatus(status: Status.SUCCESS),
            districtStatus:
                DistrictStatus(districts: districts, status: Status.SUCCESS)));
      } catch (e) {
        emit(state.copyWith(
            districtStatus: const DistrictStatus(status: Status.FAILED)));
      }
    });

    //Loading State Wards
    on<OnLoadWard>((event, emit) async {
      emit(state.copyWith(wardStatus: const WardStatus()));
      try {
        var wards = await AddressRepository().getWards(event.districtId);
        emit(state.copyWith(
            wardStatus: WardStatus(wards: wards, status: Status.SUCCESS)));
      } catch (e) {
        emit(state.copyWith(
            wardStatus: const WardStatus(
                status: Status.FAILED, message: "Failed to load wards")));
      }
    });

    on<OnFullNameChange>((event, emit) async {
      emit(state.copyWith(
          formInputStatus:
              state.formInputStatus?.copyFrom(fullName: event.fullName)));
    });

    on<OnBirthdayChange>((event, emit) async {
      emit(state.copyWith(
          formInputStatus:
              state.formInputStatus?.copyFrom(birthday: event.birthday)));
    });

    on<OnInsuranceCodeChange>((event, emit) async {
      emit(state.copyWith(
          formInputStatus: state.formInputStatus
              ?.copyFrom(insuranceCode: event.insuranceCode)));
    });

    on<OnEmailChange>((event, emit) async {
      emit(state.copyWith(
          formInputStatus:
              state.formInputStatus?.copyFrom(email: event.email)));
    });
    on<OnSexChange>((event, emit) async {
      emit(state.copyWith(
          formInputStatus: state.formInputStatus?.copyFrom(sex: event.sex)));
    });
    on<OnAddressChange>((event, emit) async {
      emit(state.copyWith(
          formInputStatus:
              state.formInputStatus?.copyFrom(address: event.address)));
    });
    on<OnIdentityCodeChange>((event, emit) async {
      emit(state.copyWith(
          formInputStatus: state.formInputStatus
              ?.copyFrom(identityCode: event.identityCode)));
    });

    //Submit Form Infomation Acount
    on<OnSubmitEvent>((event, emit) async {
      print(state.formInputStatus);
      //Check form validate
      if (event.isSubmit && state.formInputStatus!.isValidFormInput() == true) {
        //Create Account
        if (event.username != null && event.password != null) {
          print("oi");
          try {
            var model = RegisterModel(
                firstName: state.formInputStatus?.fullName ?? "",
                lastName: "",
                sex: state.formInputStatus?.sex == 0 ? false : true,
                identityCard: state.formInputStatus?.identityCode ?? "",
                dateOfBirth: state.formInputStatus!.birthday!,
                country: "Việt Nam",
                province: state.provinceStatus!.provinces!
                    .firstWhere((element) =>
                        element.code == state.provinceStatus?.codeSelect!)
                    .codeName,
                district: state.districtStatus!.districts
                    .firstWhere((element) =>
                        element.code == state.districtStatus?.codeSelect!)
                    .codeName,
                village: state.wardStatus!.wards
                    .firstWhere((element) =>
                        element.code == state.wardStatus?.codeSelect)
                    .codeName,
                address: state.formInputStatus!.address,
                phoneNumber: event.username!,
                password: event.password!,
                customerTypeId: 1);
            var register = await AuthRepository().register(model);
            if (register.isSuccess) {
              emit(state.copyWith(
                  submitState:
                      const ProfileSubmitState(submit: true, isValid: true)));
            } else {
              emit(state.copyWith(
                  submitState: ProfileSubmitState(
                      isValid: false, message: register.messages?.first)));
            }
          } catch (e) {
            print("failed: " + e.toString());
            emit(state.copyWith(
                submitState: ProfileSubmitState(
                    submit: true, isValid: false, message: e.toString())));
          }
        }
        //Update infomation Account
        else {
          emit(state.copyWith(
              submitState:
                  const ProfileSubmitState(submit: true, isValid: true)));
        }
      } else {
        emit(state.copyWith(
            submitState:
                const ProfileSubmitState(submit: true, isValid: false)));
      }
    });
  }
}
