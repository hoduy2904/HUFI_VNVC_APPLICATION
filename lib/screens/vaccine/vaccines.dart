import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hufi_vnvc_application/blocs/form_search_bloc/form_search_bloc.dart';
import 'package:hufi_vnvc_application/blocs/vaccine_bloc/vaccine_event.dart';
import 'package:hufi_vnvc_application/blocs/vaccine_bloc/vaccine_state.dart';
import 'package:hufi_vnvc_application/blocs/vaccine_bloc/vacicne_bloc.dart';
import 'package:hufi_vnvc_application/utils/Debouncer/debouncer.dart';
import 'package:hufi_vnvc_application/utils/FormWithSearchWidget/form_with_search.dart';
import 'package:hufi_vnvc_application/widgets/list_vaccine_widget.dart';

class VaccinesScreen extends StatelessWidget {
  final bool isShowAppBar;
  const VaccinesScreen({this.isShowAppBar = true, super.key});

  @override
  Widget build(BuildContext context) {
    var debounce = Debouncer(milliseconds: 1000);
    return BlocProvider(
      create: (context) => VaccineBloc()..add(OnLoadCategoryEvent()),
      child: BlocBuilder<VaccineBloc, VaccineState>(builder: ((context, state) {
        return FormWithSearchWidget(
            isShowAppBar: isShowAppBar,
            titleBar: "Danh mục vắc xin",
            hint: "Tìm theo tên vắc xin",
            searchChange: (search) => {
                  context
                      .read<VaccineBloc>()
                      .add(OnLoadProductEvent(search: search))
                },
            child: Expanded(
                child: NotificationListener<ScrollEndNotification>(
              onNotification: ((notification) {
                if (notification.metrics.maxScrollExtent -
                        notification.metrics.pixels <
                    10) {
                  debounce.run(() =>
                      {context.read<VaccineBloc>().add(OnFetchVaccineEvent())});
                }
                return true;
              }),
              child: VaccineListWidget(
                vaccines: state.vaccineSuccessState?.vaccines ?? [],
                categories: state.categorySuccessState?.categories ?? [],
                categoryId: state.categorySuccessState!.currentId ?? 0,
                categoryChange: (value) => {
                  context.read<VaccineBloc>()
                    ..add(OnClickCategoryEvent(id: value))
                },
              ),
            )));
      })),
    );
  }
}
