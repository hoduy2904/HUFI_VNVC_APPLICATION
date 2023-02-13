import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hufi_vnvc_application/blocs/cart_bloc/cart_bloc.dart';
import 'package:hufi_vnvc_application/blocs/cart_bloc/cart_state.dart';
import 'package:hufi_vnvc_application/blocs/vaccine_bloc/vaccine_state.dart';
import 'package:hufi_vnvc_application/blocs/vaccine_bloc/vacicne_bloc.dart';
import 'package:hufi_vnvc_application/models/vaccine_category_model.dart';
import 'package:hufi_vnvc_application/models/vaccine_model.dart';
import 'package:hufi_vnvc_application/themes/color.dart';
import 'package:hufi_vnvc_application/utils/ToastWidget/toast_widget.dart';
import 'package:hufi_vnvc_application/widgets/category_horization_widget.dart';
import 'package:hufi_vnvc_application/widgets/items/vaccine_item.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class VaccineListWidget extends StatelessWidget {
  final int categoryId;
  final Function categoryChange;
  final List<VaccineModel> vaccines;
  final List<VaccineCategoryModel> categories;
  const VaccineListWidget(
      {required this.vaccines,
      required this.categories,
      required this.categoryChange,
      required this.categoryId,
      super.key});

  @override
  Widget build(BuildContext context) {
    FToast fToast = FToast();
    fToast.init(context);
    return BlocListener<CartBloc, CartState>(
        listener: ((context, state) {
          if (state is AddToCartResult) {
            if (state.isSuccess) {
              fToast.showToast(
                  child: ToastWidget(
                      icon: const Icon(
                        Icons.check_circle_outline,
                        color: Colors.lightGreen,
                      ),
                      message: state.message,
                      status: "success"));
            }
          }
        }),
        child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 15),
            child: Column(children: [
              CategoryHorizationWidget(
                items: categories,
                groupValue: categoryId,
                onTap: (value) => categoryChange(value),
              ),
              const SizedBox(
                height: 10,
              ),
              BlocBuilder<VaccineBloc, VaccineState>(
                  builder: ((context, state) {
                if (state.vaccineStatus == VaccineStatus.VaccineLoading) {
                  return Expanded(
                      child: Center(
                    child: LoadingAnimationWidget.fourRotatingDots(
                        color: ColorTheme.primary, size: 24),
                  ));
                } else if (state.vaccineStatus ==
                    VaccineStatus.VaccineSuccess) {
                  return Expanded(
                      child: ListView(
                    shrinkWrap: true,
                    children: [
                      GridView.builder(
                        primary: false,
                        shrinkWrap: true,
                        itemCount: vaccines.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                mainAxisExtent: 330,
                                crossAxisCount: 2,
                                crossAxisSpacing: 15),
                        itemBuilder: ((context, index) =>
                            VaccineItem(vaccines[index])),
                      ),
                      if (!state.isEndPage)
                        LoadingAnimationWidget.fourRotatingDots(
                            color: ColorTheme.primary, size: 24)
                    ],
                  ));
                } else {
                  return const Expanded(
                      child: Center(
                    child: Text("Không có vắc xin nào"),
                  ));
                }
              }))
            ])));
  }
}
