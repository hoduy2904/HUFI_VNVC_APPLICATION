import 'package:flutter/material.dart';
import 'package:hufi_vnvc_application/models/vaccine_category_model.dart';
import 'package:hufi_vnvc_application/models/vaccine_model.dart';
import 'package:hufi_vnvc_application/widgets/carousel_cateogry_widget.dart';
import 'package:hufi_vnvc_application/widgets/carousel_image_widget.dart';
import 'package:hufi_vnvc_application/widgets/category_horization_widget.dart';
import 'package:hufi_vnvc_application/widgets/items/vaccine_item.dart';
import 'package:hufi_vnvc_application/widgets/layout/top_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentCategory = listCateogry.first.id;
  @override
  Widget build(BuildContext context) {
    final List<String> imgList = [
      'https://vnvc.vn/wp-content/uploads/2022/12/tiem-goi-vacxin-theo-yeu-cau-mb.jpg',
      'https://vnvc.vn/wp-content/uploads/2021/12/uu-dai-giang-sinh-nam-moi-768x402.jpg',
      'https://vnvc.vn/wp-content/uploads/2022/12/vnvc-nga-bay-hau-giang-dat-giu-vac-xin-768x402.jpg',
    ];
    return Scaffold(
      appBar: const TopAppBar(),
      body: ListView(shrinkWrap: true, children: <Widget>[
        CarouselWidget(
          images: imgList,
        ),
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
          padding: const EdgeInsets.symmetric(horizontal: 22),
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
      1,
      2,
      "https://file3.qdnd.vn/data/images/0/2021/12/01/tranyen/qdnd%20vaccine%20pfizer.jpg?dpi=150&quality=100&w=870",
      "Vắc xin 4 trong 1 ssssssssssssssss",
      "Phòng bệnh",
      50000,
      20000),
  VaccineModel(
      2,
      1,
      "https://file3.qdnd.vn/data/images/0/2021/12/01/tranyen/qdnd%20vaccine%20pfizer.jpg?dpi=150&quality=100&w=870",
      "Vắc xin 4 trong 1",
      "Phòng bệnh",
      50000,
      20000),
  VaccineModel(
      3,
      2,
      "https://file3.qdnd.vn/data/images/0/2021/12/01/tranyen/qdnd%20vaccine%20pfizer.jpg?dpi=150&quality=100&w=870",
      "Vắc xin 4 trong 1",
      "Phòng bệnh",
      50000,
      20000),
  VaccineModel(
      4,
      4,
      "https://file3.qdnd.vn/data/images/0/2021/12/01/tranyen/qdnd%20vaccine%20pfizer.jpg?dpi=150&quality=100&w=870",
      "Vắc xin 4 trong 1",
      "Phòng bệnh",
      50000,
      20000),
];
