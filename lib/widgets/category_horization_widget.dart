import 'package:flutter/material.dart';
import 'package:hufi_vnvc_application/models/vaccine_category_model.dart';
import 'package:hufi_vnvc_application/utils/RadioButtonWidget/radio_button.dart';

class CategoryHorizationWidget extends StatelessWidget {
  final List<VaccineCategoryModel> items;
  final int? groupValue;
  final Function onTap;
  const CategoryHorizationWidget(
      {required this.onTap,
      this.groupValue,
      this.items = const <VaccineCategoryModel>[],
      super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 27,
        child: ListView(
            scrollDirection: Axis.horizontal,
            children: items
                .map((e) => RadioButtom(
                      value: e.id,
                      groupValue: groupValue,
                      onChange: (value) => {onTap(value)},
                      text: e.name,
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      isBorder: true,
                      fontSize: 12,
                      borderRadius: BorderRadius.circular(5),
                      padding: const EdgeInsets.all(5),
                    ))
                .toList()));
  }
}
