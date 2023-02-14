import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hufi_vnvc_application/blocs/vaccine_bloc/vaccine_package_bloc/vaccine_package_bloc.dart';
import 'package:hufi_vnvc_application/blocs/vaccine_bloc/vaccine_package_bloc/vaccine_package_state.dart';
import 'package:hufi_vnvc_application/models/vaccine_package_model.dart';
import 'package:hufi_vnvc_application/themes/color.dart';
import 'package:hufi_vnvc_application/widgets/items/vaccine_package_item.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class VaccinePackageListWidget extends StatelessWidget {
  final List<VaccinePackageModel> vaccinePackage;
  const VaccinePackageListWidget({this.vaccinePackage = const [], super.key});

  @override
  Widget build(BuildContext context) {
    FToast fToast = FToast();
    fToast.init(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 15),
      child: BlocBuilder<VaccinePackageBloc, VaccinePackageState>(
          builder: ((context, state) {
        if (state.status == VaccinePackageStatus.Loading) {
          return Center(
            child: LoadingAnimationWidget.fourRotatingDots(
                color: ColorTheme.primary, size: 24),
          );
        } else if (state.status == VaccinePackageStatus.Success) {
          return ListView(
            shrinkWrap: true,
            children: [
              GridView.builder(
                primary: false,
                shrinkWrap: true,
                itemCount: vaccinePackage.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisExtent: 330,
                    crossAxisCount: 2,
                    crossAxisSpacing: 15),
                itemBuilder: ((context, index) =>
                    VaccinePackageItem(vaccinePackage[index])),
              ),
              if (!state.isEndPage)
                LoadingAnimationWidget.fourRotatingDots(
                    color: ColorTheme.primary, size: 24)
            ],
          );
        } else {
          return const Center(
            child: Text("Không có vắc xin nào"),
          );
        }
      })),
    );
  }
}
