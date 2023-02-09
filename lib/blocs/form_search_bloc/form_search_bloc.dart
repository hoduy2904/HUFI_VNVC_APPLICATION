import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FormSearchBloc extends Bloc<FromSearchEvent, FormSearchState> {
  FormSearchBloc() : super(const FormSearchState()) {
    on<OnSearchChangeEvent>(
        (event, emit) => emit(FormSearchState(search: event.search)));
  }
}

class FormSearchState extends Equatable {
  final String? search;
  const FormSearchState({this.search});
  @override
  // TODO: implement props
  List<Object?> get props => [search];
}

class FromSearchEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class OnSearchChangeEvent extends FromSearchEvent {
  final String? search;
  OnSearchChangeEvent({required this.search});
  @override
  // TODO: implement props
  List<Object?> get props => [search];
}
