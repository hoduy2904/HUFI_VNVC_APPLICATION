import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hufi_vnvc_application/blocs/profile_bloc/form_input_status/form_input_status.dart';
import 'package:hufi_vnvc_application/blocs/profile_bloc/profile_event.dart';
import 'package:hufi_vnvc_application/blocs/profile_bloc/profile_state.dart';
import 'package:hufi_vnvc_application/blocs/profile_bloc/address_status/district_status.dart';
import 'package:hufi_vnvc_application/blocs/profile_bloc/address_status/province_status.dart';
import 'package:hufi_vnvc_application/blocs/profile_bloc/address_status/ward_status.dart';
import 'package:hufi_vnvc_application/repositories/address_repository.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(const ProfileInitialState()) {
    //Loading State Provinces
    on<OnLoadProvince>((event, emit) async {
      emit(state.copyWith(provinceStatus: const ProvinceStatus()));
      try {
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
              state.formInputStatus?.copyFrom(fullName: event.birthday)));
    });

    on<OnInsuranceCodeChange>((event, emit) async {
      emit(state.copyWith(
          formInputStatus:
              state.formInputStatus?.copyFrom(fullName: event.insuranceCode)));
    });
    on<OnEmailChange>((event, emit) async {
      emit(
          state.copyWith(formInputStatus: FormInputStatus(email: event.email)));
    });
    on<OnSexChange>((event, emit) async {
      emit(state.copyWith(
          formInputStatus: state.formInputStatus?.copyFrom(sex: event.sex)));
    });
  }
}
