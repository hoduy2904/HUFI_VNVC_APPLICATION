import 'package:flutter/material.dart';
import 'package:hufi_vnvc_application/models/category_model.dart';
import 'package:hufi_vnvc_application/screens/history_buy/history_buy.dart';
import 'package:hufi_vnvc_application/screens/notification/notification.dart';
import 'package:hufi_vnvc_application/screens/order/order.dart';
import 'package:hufi_vnvc_application/screens/record/record.dart';
import 'package:hufi_vnvc_application/screens/vaccine/vaccine_package.dart';
import 'package:hufi_vnvc_application/screens/vaccine/vaccines.dart';
import 'package:hufi_vnvc_application/widgets/items/category_item.dart';

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
        const CategoryModel(Icons.history_outlined, "Lịch sử mua"),
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
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const NotificationScreen()))
        },
      ),
      CategoryItem(
        const CategoryModel(Icons.list_alt_outlined, "Gói Vắc xin"),
        onClick: () => {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const VaccinePackageScreen()))
        },
      ),
      // CategoryItem(
      //   const CategoryModel(Icons.message_outlined, "Trò chuyện"),
      //   onClick: () => {
      //     Navigator.push(context,
      //         MaterialPageRoute(builder: (context) => const ChatScreen()))
      //   },
      // ),
      CategoryItem(
        const CategoryModel(Icons.schedule_outlined, "Lịch tiêm"),
        onClick: () => {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const RecordScreen()))
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
