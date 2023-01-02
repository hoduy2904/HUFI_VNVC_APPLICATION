import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/vaccine_model.dart';
import 'package:flutter_application_1/utils/RadioButtonWidget/radio_button.dart';
import 'package:flutter_application_1/widgets/vaccine_item.dart';

class VaccineListWidget extends StatelessWidget {
  const VaccineListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 15),
        child: Column(children: [
          SizedBox(
              height: 27,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  RadioButtom(
                      margin: const EdgeInsets.symmetric(horizontal: 2),
                      isBorder: true,
                      fontSize: 12,
                      borderRadius: BorderRadius.circular(30),
                      padding: EdgeInsets.all(5),
                      value: "vx4",
                      groupValue: "vx4",
                      onChange: (value) => {},
                      text: "Vắc xin 4 trong 1"),
                  RadioButtom(
                      margin: const EdgeInsets.symmetric(horizontal: 2),
                      isBorder: true,
                      fontSize: 12,
                      borderRadius: BorderRadius.circular(30),
                      padding: EdgeInsets.all(5),
                      value: "vx4",
                      groupValue: "vx",
                      onChange: (value) => {},
                      text: "Vắc xin 4 trong 1"),
                  RadioButtom(
                      margin: const EdgeInsets.symmetric(horizontal: 2),
                      isBorder: true,
                      fontSize: 12,
                      borderRadius: BorderRadius.circular(30),
                      padding: EdgeInsets.all(5),
                      value: "vx4",
                      groupValue: "vx3",
                      onChange: (value) => {},
                      text: "Vắc xin 4 trong 1"),
                  RadioButtom(
                      margin: const EdgeInsets.symmetric(horizontal: 2),
                      isBorder: true,
                      fontSize: 12,
                      borderRadius: BorderRadius.circular(30),
                      padding: EdgeInsets.all(5),
                      value: "vx4",
                      groupValue: "vx45",
                      onChange: (value) => {},
                      text: "Vắc xin 4 trong 1"),
                  RadioButtom(
                      margin: const EdgeInsets.symmetric(horizontal: 2),
                      isBorder: true,
                      fontSize: 12,
                      borderRadius: BorderRadius.circular(30),
                      padding: EdgeInsets.all(5),
                      value: "vx4",
                      groupValue: "vx42",
                      onChange: (value) => {},
                      text: "Vắc xin 4 trong 1"),
                  RadioButtom(
                      margin: const EdgeInsets.symmetric(horizontal: 2),
                      isBorder: true,
                      fontSize: 12,
                      borderRadius: BorderRadius.circular(30),
                      padding: EdgeInsets.all(5),
                      value: "vx4",
                      groupValue: "vx41",
                      onChange: (value) => {},
                      text: "Vắc xin 4 trong 1")
                ],
              )),
          SizedBox(
            height: 10,
          ),
          Expanded(
              child: ListView(
            children: [
              GridView(
                primary: false,
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisExtent: 320,
                    crossAxisCount: 2,
                    crossAxisSpacing: 15),
                children: list,
              )
            ],
          ))
        ]));
  }
}

final list = [
  VaccineItem(
    Vaccine(
        "https://file3.qdnd.vn/data/images/0/2021/12/01/tranyen/qdnd%20vaccine%20pfizer.jpg?dpi=150&quality=100&w=870",
        "Vắc xin 4 trong 1 ssssssssssssssss",
        "Phòng bệnh",
        50000,
        20000),
  ),
  VaccineItem(
    Vaccine(
        "https://file3.qdnd.vn/data/images/0/2021/12/01/tranyen/qdnd%20vaccine%20pfizer.jpg?dpi=150&quality=100&w=870",
        "Vắc xin 4 trong 1",
        "Phòng bệnh",
        50000,
        20000),
  ),
  VaccineItem(
    Vaccine(
        "https://file3.qdnd.vn/data/images/0/2021/12/01/tranyen/qdnd%20vaccine%20pfizer.jpg?dpi=150&quality=100&w=870",
        "Vắc xin 4 trong 1",
        "Phòng bệnh",
        50000,
        20000),
  ),
  VaccineItem(
    Vaccine(
        "https://file3.qdnd.vn/data/images/0/2021/12/01/tranyen/qdnd%20vaccine%20pfizer.jpg?dpi=150&quality=100&w=870",
        "Vắc xin 4 trong 1",
        "Phòng bệnh",
        50000,
        20000),
  ),
];
