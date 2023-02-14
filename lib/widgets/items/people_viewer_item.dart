import 'package:age_calculator/age_calculator.dart';
import 'package:flutter/material.dart';
import 'package:hufi_vnvc_application/models/customer_model.dart';

class PeopleItem extends StatelessWidget {
  final CustomerModel peopleItemModel;
  final Function onTab;
  const PeopleItem(
      {required this.peopleItemModel, required this.onTab, super.key});

  @override
  Widget build(BuildContext context) {
    var age = AgeCalculator.age(peopleItemModel.dateOfBirth);
    var stringAge =
        "${age.years} tuổi, ${age.months} ${age.months > 0 ? 'tháng' : 'tháng,' "${age.days} ngày"} ";
    return InkWell(
        onTap: () {
          onTab(peopleItemModel.id);
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.grey.shade300))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              peopleItemModel.address.isEmpty
                  ? CircleAvatar(
                      child: ClipRRect(
                      borderRadius: BorderRadius.circular(45),
                      child: Image.asset(
                          fit: BoxFit.fill, "assets/image/avatar.png"),
                    ))
                  : CircleAvatar(
                      child: ClipRRect(
                      borderRadius: BorderRadius.circular(45),
                      child: Image.network(
                          fit: BoxFit.fill, peopleItemModel.avatar ?? ""),
                    )),
              const SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Họ và tên: ${peopleItemModel.firstName} ${peopleItemModel.lastName}",
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                  Text(
                    "Tuổi: $stringAge",
                    style: Theme.of(context).textTheme.bodySmall,
                  )
                ],
              )
            ],
          ),
        ));
  }
}
