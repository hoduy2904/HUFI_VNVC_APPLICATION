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
  const VaccineModel(
      1,
      2,
      "https://file3.qdnd.vn/data/images/0/2021/12/01/tranyen/qdnd%20vaccine%20pfizer.jpg?dpi=150&quality=100&w=870",
      "Vắc xin 4 trong 1 ssssssssssssssss",
      "Phòng bệnh",
      50000,
      20000),
  const VaccineModel(
      2,
      1,
      "https://file3.qdnd.vn/data/images/0/2021/12/01/tranyen/qdnd%20vaccine%20pfizer.jpg?dpi=150&quality=100&w=870",
      "Vắc xin 4 trong 1",
      "Phòng bệnh",
      50000,
      20000),
  const VaccineModel(
      3,
      2,
      "https://file3.qdnd.vn/data/images/0/2021/12/01/tranyen/qdnd%20vaccine%20pfizer.jpg?dpi=150&quality=100&w=870",
      "Vắc xin 4 trong 1",
      "Phòng bệnh",
      50000,
      20000),
  const VaccineModel(
      4,
      4,
      "https://file3.qdnd.vn/data/images/0/2021/12/01/tranyen/qdnd%20vaccine%20pfizer.jpg?dpi=150&quality=100&w=870",
      "Vắc xin 4 trong 1",
      "Phòng bệnh",
      50000,
      20000),
];
final listCateogry = [
  const VaccineCategoryModel(1, "Vắc xin 4 trong 1"),
  const VaccineCategoryModel(2, "Trẻ em"),
  const VaccineCategoryModel(3, "Người lớn"),
  const VaccineCategoryModel(4, "Covid-19"),
  const VaccineCategoryModel(5, "Người già"),
  const VaccineCategoryModel(6, "Bà bầu"),
];
