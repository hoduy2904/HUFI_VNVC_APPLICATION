import 'package:flutter/material.dart';
import 'package:hufi_vnvc_application/models/people_item_model.dart';
import 'package:hufi_vnvc_application/themes/color.dart';
import 'package:hufi_vnvc_application/widgets/items/people_viewer_item.dart';

class PeopleOrder extends StatelessWidget {
  final Function onSelect;
  const PeopleOrder({required this.onSelect, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  style: const TextStyle(fontSize: 12),
                  decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.search,
                        color: ColorTheme.primary,
                      ),
                      hintStyle: const TextStyle(fontSize: 12),
                      hintText: "Tìm kiếm theo tên",
                      isDense: true,
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 12),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: ColorTheme.primary),
                          borderRadius: BorderRadius.circular(5))),
                ),
                const SizedBox(
                  height: 30,
                ),
                Column(
                  children: list
                      .map((e) => PeopleItem(
                          peopleItemModel: e, onTab: (id) => {onSelect(id)}))
                      .toList(),
                )
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: (() {}),
            backgroundColor: ColorTheme.primary,
            child: const Icon(
              Icons.plus_one,
              color: Colors.white,
            ),
          )),
    );
  }
}

const list = [
  PeopleItemModel(
      1,
      "https://upload.wikimedia.org/wikipedia/commons/f/fe/Son_Tung_M-TP_1_%282017%29.png",
      "Nguyễn Thanh Tùng",
      26),
  PeopleItemModel(
      2,
      "https://media.coolmate.me/cdn-cgi/image/quality=80,format=auto/uploads/September2022/mono-bat-ngo-xuat-hien-sau-khi-tao-bao-voi-waiting-for-you-body-cuc-chay-tiep-tuc-gay-sot-cba-6656027.png",
      "Nguyễn Việt Hoàng",
      24),
];
