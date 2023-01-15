import 'package:flutter/material.dart';
import 'package:hufi_vnvc_application/models/vaccine_category_model.dart';
import 'package:hufi_vnvc_application/models/vaccine_model.dart';
import 'package:hufi_vnvc_application/utils/FormWithSearchWidget/form_with_search.dart';
import 'package:hufi_vnvc_application/widgets/list_vaccine_widget.dart';

class VaccinesScreen extends StatefulWidget {
  final bool isShowAppBar;
  const VaccinesScreen({this.isShowAppBar = true, super.key});

  @override
  State<VaccinesScreen> createState() => _VaccinesScreenState();
}

class _VaccinesScreenState extends State<VaccinesScreen> {
  int currentCategory = listCateogry.first.id;
  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FormWithSearchWidget(
      isShowAppBar: widget.isShowAppBar,
      titleBar: "Danh mục vắc xin",
      searchChange: () => {},
      child: Expanded(
          child: VaccineListWidget(
        vaccines: list
            .where((element) => element.categoryId == currentCategory)
            .toList(),
        categories: listCateogry,
        categoryId: currentCategory,
        categoryChange: (value) => {
          setState(() {
            currentCategory = value;
          })
        },
      )),
    );
  }
}

final list = [
  VaccineModel(
      quantityRemain: 20,
      id: 1,
      categoryId: 2,
      images:
          "https://file3.qdnd.vn/data/images/0/2021/12/01/tranyen/qdnd%20vaccine%20pfizer.jpg?dpi=150&quality=100&w=870",
      name: "Vắc xin 4 trong 1 ssssssssssssssss",
      prevention: "Phòng bệnh",
      price: 50000,
      priceOld: 20000),
  VaccineModel(
      quantityRemain: 20,
      id: 1,
      categoryId: 2,
      images:
          "https://file3.qdnd.vn/data/images/0/2021/12/01/tranyen/qdnd%20vaccine%20pfizer.jpg?dpi=150&quality=100&w=870",
      name: "Vắc xin 4 trong 1 ssssssssssssssss",
      prevention: "Phòng bệnh",
      price: 50000,
      priceOld: 20000),
  VaccineModel(
      quantityRemain: 20,
      id: 1,
      categoryId: 2,
      images:
          "https://file3.qdnd.vn/data/images/0/2021/12/01/tranyen/qdnd%20vaccine%20pfizer.jpg?dpi=150&quality=100&w=870",
      name: "Vắc xin 4 trong 1 ssssssssssssssss",
      prevention: "Phòng bệnh",
      price: 50000,
      priceOld: 20000),
  VaccineModel(
      quantityRemain: 20,
      id: 1,
      categoryId: 2,
      images:
          "https://file3.qdnd.vn/data/images/0/2021/12/01/tranyen/qdnd%20vaccine%20pfizer.jpg?dpi=150&quality=100&w=870",
      name: "Vắc xin 4 trong 1 ssssssssssssssss",
      prevention: "Phòng bệnh",
      price: 50000,
      priceOld: 20000),
];
final listCateogry = [
  const VaccineCategoryModel(id: 1, name: "Vắc xin 4 trong 1"),
  const VaccineCategoryModel(id: 2, name: "Trẻ em"),
  const VaccineCategoryModel(id: 3, name: "Người lớn"),
  const VaccineCategoryModel(id: 4, name: "Covid-19"),
  const VaccineCategoryModel(id: 5, name: "Người già"),
  const VaccineCategoryModel(id: 6, name: "Bà bầu"),
];
