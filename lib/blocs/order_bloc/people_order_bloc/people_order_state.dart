import 'package:equatable/equatable.dart';
import 'package:hufi_vnvc_application/models/customer_model.dart';

class PeopleOrderState extends Equatable {
  @override
  List<Object?> get props => [];
}

class PeopleOrderLoadingState extends PeopleOrderState {}

class PeopleOrderSuccessState extends PeopleOrderState {
  final CustomerModel people;
  PeopleOrderSuccessState({required this.people});
  @override
  List<Object?> get props => [people];
}

class PeopleOrderFailedState extends PeopleOrderState {
  final String error;
  PeopleOrderFailedState({required this.error});
  @override
  List<Object?> get props => [error];
}
