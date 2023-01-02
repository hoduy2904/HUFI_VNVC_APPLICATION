import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/vaccine_category_model.dart';
import 'package:flutter_application_1/models/vaccine_model.dart';
import 'package:flutter_application_1/widgets/carousel_cateogry_widget.dart';
import 'package:flutter_application_1/widgets/carousel_image_widget.dart';
import 'package:flutter_application_1/widgets/category_horization_widget.dart';
import 'package:flutter_application_1/widgets/items/vaccine_item.dart';
import 'package:flutter_application_1/widgets/list_vaccine_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentCategory = listCateogry.first.id;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(shrinkWrap: true, children: <Widget>[
        const CarouselWidget(),
        const SizedBox(
          height: 30,
        ),
        const CategoryCarouselWidget(),
        const SizedBox(
          height: 10,
        ),
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: Colors.blue.shade100,
              borderRadius: BorderRadius.circular(10)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.network(
                  excludeFromSemantics: true,
                  width: 80,
                  scale: 5,
                  fit: BoxFit.cover,
                  "https://vnvc.vn/img/logo.png"),
              Image.network(
                  width: 80, fit: BoxFit.cover, "https://vnvc.vn/img/logo.png"),
              Image.network(
                  width: 80, fit: BoxFit.cover, "https://vnvc.vn/img/logo.png"),
              Image.network(
                  width: 80, fit: BoxFit.cover, "https://vnvc.vn/img/logo.png"),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 22),
          child: Column(
            children: [
              Container(
                alignment: Alignment.topLeft,
                child: Text(
                  "Danh mục vắc xin",
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              CategoryHorizationWidget(
                items: listCateogry,
                groupValue: currentCategory,
                onTap: (value) => {
                  setState(() {
                    currentCategory = value;
                  })
                },
              ),
              const SizedBox(
                height: 10,
              ),
              GridView(
                primary: false,
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisExtent: 325,
                    crossAxisCount: 2,
                    crossAxisSpacing: 15),
                children: list
                    .where((element) => element.categoryId == currentCategory)
                    .map((e) => VaccineItem(e))
                    .toList(),
              )
            ],
          ),
        )
      ]),
    );
  }
}

final listCateogry = [
  VaccineCategoryModel(1, "Vắc xin 4 trong 1"),
  VaccineCategoryModel(2, "Trẻ em"),
  VaccineCategoryModel(3, "Người lớn"),
  VaccineCategoryModel(4, "Covid-19"),
  VaccineCategoryModel(5, "Người già"),
  VaccineCategoryModel(6, "Bà bầu"),
];

final list = [
  VaccineModel(
      2,
      "https://file3.qdnd.vn/data/images/0/2021/12/01/tranyen/qdnd%20vaccine%20pfizer.jpg?dpi=150&quality=100&w=870",
      "Vắc xin 4 trong 1 ssssssssssssssss",
      "Phòng bệnh",
      50000,
      20000),
  VaccineModel(
      1,
      "https://file3.qdnd.vn/data/images/0/2021/12/01/tranyen/qdnd%20vaccine%20pfizer.jpg?dpi=150&quality=100&w=870",
      "Vắc xin 4 trong 1",
      "Phòng bệnh",
      50000,
      20000),
  VaccineModel(
      2,
      "https://file3.qdnd.vn/data/images/0/2021/12/01/tranyen/qdnd%20vaccine%20pfizer.jpg?dpi=150&quality=100&w=870",
      "Vắc xin 4 trong 1",
      "Phòng bệnh",
      50000,
      20000),
  VaccineModel(
      4,
      "https://file3.qdnd.vn/data/images/0/2021/12/01/tranyen/qdnd%20vaccine%20pfizer.jpg?dpi=150&quality=100&w=870",
      "Vắc xin 4 trong 1",
      "Phòng bệnh",
      50000,
      20000),
];
