import 'package:flutter/material.dart';
import 'package:hufi_vnvc_application/models/vaccine_category_model.dart';
import 'package:hufi_vnvc_application/models/vaccine_model.dart';
import 'package:hufi_vnvc_application/widgets/category_horization_widget.dart';
import 'package:hufi_vnvc_application/widgets/items/vaccine_item.dart';

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
    return Padding(
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
          Expanded(
              child: ListView(
            shrinkWrap: true,
            children: [
              GridView(
                primary: false,
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisExtent: 320,
                    crossAxisCount: 2,
                    crossAxisSpacing: 15),
                children: vaccines.map((e) => VaccineItem(e)).toList(),
              )
            ],
          ))
        ]));
  }
}
