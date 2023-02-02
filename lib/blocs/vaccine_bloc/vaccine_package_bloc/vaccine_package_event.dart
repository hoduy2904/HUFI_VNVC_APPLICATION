import 'package:equatable/equatable.dart';

class VaccinePackageEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class OnLoadVaccinePackageEvent extends VaccinePackageEvent {
  final String? search;
  OnLoadVaccinePackageEvent({this.search});
  @override
  List<Object?> get props => [search];
}

class OnFetchVaccinePackageEvent extends VaccinePackageEvent {}
