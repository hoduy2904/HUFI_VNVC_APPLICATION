import 'dart:math';

import 'package:equatable/equatable.dart';
import 'package:hufi_vnvc_application/models/customer_model.dart';
import 'package:hufi_vnvc_application/models/people_item_model.dart';

class PeopleOrderState extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class PeopleOrderLoadingState extends PeopleOrderState {}

class PeopleOrderSuccessState extends PeopleOrderState {
  final CustomerModel people;
  PeopleOrderSuccessState({required this.people});
  @override
  // TODO: implement props
  List<Object?> get props => [people];
}

class PeopleOrderFailedState extends PeopleOrderState {
  final String error;
  PeopleOrderFailedState({required this.error});
  @override
  // TODO: implement props
  List<Object?> get props => [error];
}
