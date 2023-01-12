import 'package:flutter/material.dart';
import 'package:hufi_vnvc_application/models/vaccine_model.dart';
import 'package:hufi_vnvc_application/themes/color.dart';
import 'package:hufi_vnvc_application/widgets/items/vaccine_cart_item.dart';

class PaymentOrder extends StatelessWidget {
  final Function onPay;
  const PaymentOrder({required this.onPay, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 10),
                alignment: Alignment.topLeft,
                child: const Text(
                  "Chọn vắc xin cho người tiêm",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.none,
                      fontSize: 14,
                      color: Colors.black),
                ),
              ),
              Container(
                alignment: Alignment.topLeft,
                margin: const EdgeInsets.only(bottom: 10),
                child: Text(
                  "Mỗi \"Người được tiêm\" có thể đặt mua 03 loại vắc xin khác nhau và mỗi loại 01 liều vắc xin",
                  style: Theme.of(context).textTheme.bodyText2,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        minimumSize: const Size.fromHeight(45),
                        backgroundColor: Colors.white,
                        textStyle: TextStyle(color: ColorTheme.primary),
                        side: BorderSide(color: ColorTheme.primaryStrong)),
                    onPressed: () => {},
                    child: Text(
                      "Thêm hoặc xoá vắc xin",
                      style: TextStyle(
                          color: ColorTheme.primaryStrong,
                          fontWeight: FontWeight.bold),
                    )),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 10),
                alignment: Alignment.topLeft,
                child: const Text(
                  "Danh sách vắc xin đã chọn",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.none,
                      fontSize: 14,
                      color: Colors.black),
                ),
              ),
              Column(
                children: list.map((e) => VaccineCartItem(model: e)).toList(),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size.fromHeight(45)),
                  onPressed: () => onPay(),
                  child: const Text("Đặt hàng"))
            ],
          )
        ],
      ),
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
