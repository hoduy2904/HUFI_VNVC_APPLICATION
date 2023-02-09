import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hufi_vnvc_application/blocs/vaccine_bloc/vaccine_package_bloc/vaccine_package_bloc.dart';
import 'package:hufi_vnvc_application/blocs/vaccine_bloc/vaccine_package_bloc/vaccine_package_event.dart';
import 'package:hufi_vnvc_application/blocs/vaccine_bloc/vaccine_package_bloc/vaccine_package_state.dart';
import 'package:hufi_vnvc_application/utils/Debouncer/debouncer.dart';
import 'package:hufi_vnvc_application/utils/FormWithSearchWidget/form_with_search.dart';
import 'package:hufi_vnvc_application/widgets/vaccine_package_list.dart';

class VaccinePackageScreen extends StatelessWidget {
  final bool isShowAppBar;
  const VaccinePackageScreen({this.isShowAppBar = true, super.key});

  @override
  Widget build(BuildContext context) {
    var debounce = Debouncer(milliseconds: 1000);
    return BlocProvider(
      create: (context) =>
          VaccinePackageBloc()..add(OnLoadVaccinePackageEvent()),
      child: BlocBuilder<VaccinePackageBloc, VaccinePackageState>(
          builder: ((context, state) {
        return FormWithSearchWidget(
            isShowAppBar: isShowAppBar,
            titleBar: "Danh mục gói vắc xin",
            hint: "Tìm theo tên, đối tượng gói vắc xin",
            searchChange: (search) => {
                  context
                      .read<VaccinePackageBloc>()
                      .add(OnLoadVaccinePackageEvent(search: search))
                },
            child: Expanded(
                child: NotificationListener<ScrollEndNotification>(
              onNotification: ((notification) {
                if (notification.metrics.maxScrollExtent -
                        notification.metrics.pixels <
                    10) {
                  debounce.run(() => {
                        context
                            .read<VaccinePackageBloc>()
                            .add(OnFetchVaccinePackageEvent())
                      });
                }
                return true;
              }),
              child: VaccinePackageListWidget(
                vaccinePackage: state.vaccinePackages,
              ),
            )));
      })),
    );
  }
}
