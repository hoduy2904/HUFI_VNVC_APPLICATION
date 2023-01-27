import 'package:flutter/material.dart';
import 'package:hufi_vnvc_application/models/category_model.dart';
import 'package:hufi_vnvc_application/screens/history_buy/history_buy.dart';
import 'package:hufi_vnvc_application/screens/order/order.dart';
import 'package:hufi_vnvc_application/screens/vaccine/vaccines.dart';
import 'package:hufi_vnvc_application/widgets/items/category_item.dart';
import 'package:hufi_vnvc_application/widgets/items/history_buy_item.dart';

class CategoryCarouselWidget extends StatefulWidget {
  const CategoryCarouselWidget({super.key});

  @override
  State<CategoryCarouselWidget> createState() => _CategoryCarouselWidgetState();
}

class _CategoryCarouselWidgetState extends State<CategoryCarouselWidget> {
  @override
  Widget build(BuildContext context) {
    var DUMPDATA = [
      CategoryItem(
        const CategoryModel(Icons.vaccines, "Vắc xin"),
        onClick: () => {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const VaccinesScreen()))
        },
      ),
      CategoryItem(
        const CategoryModel(Icons.schedule_rounded, "Lịch sử mua"),
        onClick: () => {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const HistoryBuyScreen()))
        },
      ),
      CategoryItem(
        const CategoryModel(Icons.money_outlined, "Đặt mua vắc xin"),
        onClick: () => {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const OrderScreen()))
        },
      ),
      CategoryItem(
        const CategoryModel(Icons.alarm, "Thông báo"),
        onClick: () => {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const VaccinesScreen()))
        },
      ),
      CategoryItem(
        const CategoryModel(Icons.category, "Danh mục"),
        onClick: () => {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const VaccinesScreen()))
        },
      ),
      CategoryItem(
        const CategoryModel(Icons.person, "Trang cá nhân"),
        onClick: () => {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const VaccinesScreen()))
        },
      ),
    ];

    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      scrollDirection: Axis.vertical,
      itemCount: DUMPDATA.length,
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4, mainAxisExtent: 100),
      itemBuilder: ((context, index) {
        return DUMPDATA[index];
      }),
    );
  }
}
