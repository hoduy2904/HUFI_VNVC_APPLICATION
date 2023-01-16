import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hufi_vnvc_application/blocs/vaccine_bloc/vaccine_event.dart';
import 'package:hufi_vnvc_application/blocs/vaccine_bloc/vaccine_state.dart';
import 'package:hufi_vnvc_application/blocs/vaccine_bloc/vacicne_bloc.dart';
import 'package:hufi_vnvc_application/utils/FormWithSearchWidget/form_with_search.dart';
import 'package:hufi_vnvc_application/widgets/list_vaccine_widget.dart';

class VaccinesScreen extends StatefulWidget {
  final bool isShowAppBar;
  const VaccinesScreen({this.isShowAppBar = true, super.key});

  @override
  State<VaccinesScreen> createState() => _VaccinesScreenState();
}

class _VaccinesScreenState extends State<VaccinesScreen> {
  @override
  Widget build(BuildContext context) {
    return FormWithSearchWidget(
        isShowAppBar: widget.isShowAppBar,
        titleBar: "Danh mục vắc xin",
        searchChange: () => {},
        child: Expanded(
            child: BlocProvider(
                create: (context) => VaccineBloc()..add(OnLoadCategoryEvent()),
                child: BlocBuilder<VaccineBloc, VaccineState>(
                  builder: ((context, state) => VaccineListWidget(
                        vaccines: state.vaccineSuccessState?.vaccines ?? [],
                        categories:
                            state.categorySuccessState?.categories ?? [],
                        categoryId:
                            state.categorySuccessState?.categories.first.id ??
                                0,
                        categoryChange: (value) => {
                          context.read<VaccineBloc>()
                            ..add(OnClickCategoryEvent(id: value))
                            ..add(OnLoadProductEvent(categoryId: value)),
                        },
                      )),
                ))));
  }
}
