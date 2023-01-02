import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/category_model.dart';
import 'package:flutter_application_1/widgets/category_item.dart';

class CategoryCarouselWidget extends StatefulWidget {
  const CategoryCarouselWidget({super.key});

  @override
  State<CategoryCarouselWidget> createState() => _CategoryCarouselWidgetState();
}

class _CategoryCarouselWidgetState extends State<CategoryCarouselWidget> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      scrollDirection: Axis.vertical,
      itemCount: DUMP_DATA.length,
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4, mainAxisExtent: 100),
      itemBuilder: ((context, index) {
        return DUMP_DATA[index];
      }),
    );
  }
}

const DUMP_DATA = [
  CategoryItem(CategoryModel(Icons.vaccines, "Vắc xin")),
  CategoryItem(CategoryModel(Icons.schedule_rounded, "Lịch tiêm")),
  CategoryItem(CategoryModel(Icons.newspaper, "Tin tức")),
  CategoryItem(CategoryModel(Icons.alarm, "Thông báo")),
  CategoryItem(CategoryModel(Icons.category, "Danh mục")),
  CategoryItem(CategoryModel(Icons.person, "Trang cá nhân")),
];
