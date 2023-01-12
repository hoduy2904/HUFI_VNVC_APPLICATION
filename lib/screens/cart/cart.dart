import 'package:flutter/material.dart';
import 'package:hufi_vnvc_application/models/vaccine_model.dart';
import 'package:hufi_vnvc_application/screens/order/order.dart';
import 'package:hufi_vnvc_application/themes/color.dart';
import 'package:hufi_vnvc_application/themes/typography.dart';
import 'package:intl/intl.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorTheme.primary,
        title: Text(
          "Giỏ hàng",
          style: TypographyTheme.titleBar,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(children: [
          Column(
            children: list
                .map((model) => CartItem(context, model, (e) => {}))
                .toList(),
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(45)),
              onPressed: () => {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const OrderScreen()))
                  },
              child: const Text("Đặt mua"))
        ]),
      ),
    );
  }
}

Widget CartItem(BuildContext context, VaccineModel model, Function onTap) {
  var formatMoney = NumberFormat("#,##0", "vi_VN");
  return Card(
      margin: const EdgeInsets.symmetric(vertical: 10),
      elevation: 2,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                decoration: BoxDecoration(
                    image: const DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                            "https://media.istockphoto.com/id/911633218/vector/abstract-geometric-medical-cross-shape-medicine-and-science-concept-background.jpg?s=612x612&w=0&k=20&c=eYz8qm5xa5wbWCWKgjOpTamavekYv8XqPTA0MC4tHGA=")),
                    color: Colors.blue.shade100,
                    borderRadius: BorderRadius.circular(5)),
                child: Container(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        model.name.toUpperCase(),
                        style: const TextStyle(
                            decoration: TextDecoration.none,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Nguồn gốc: ",
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Phòng bệnh: ${model.prevention}",
                        style: Theme.of(context).textTheme.bodySmall,
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    alignment: Alignment.bottomRight,
                    child: Text(
                      "${formatMoney.format(model.price)} VNĐ",
                      style: TextStyle(
                          color: ColorTheme.primaryStrong,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                  ),
                  IconButton(
                      onPressed: () => onTap(model.id),
                      icon: const Icon(
                        Icons.delete_outline_outlined,
                        color: Colors.red,
                      ))
                ],
              )
            ],
          ),
        ),
      ));
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
