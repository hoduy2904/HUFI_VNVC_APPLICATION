import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/vaccine_category_model.dart';
import 'package:flutter_application_1/utils/RadioButtonWidget/radio_button.dart';

class CategoryHorizationWidget extends StatelessWidget {
  final List<VaccineCategoryModel> items;
  final int groupValue;
  final Function onTap;
  const CategoryHorizationWidget(
      {required this.onTap,
      required this.groupValue,
      required this.items,
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
                      margin: const EdgeInsets.symmetric(horizontal: 2),
                      isBorder: true,
                      fontSize: 12,
                      borderRadius: BorderRadius.circular(5),
                      padding: EdgeInsets.all(5),
                    ))
                .toList()));
  }
}
