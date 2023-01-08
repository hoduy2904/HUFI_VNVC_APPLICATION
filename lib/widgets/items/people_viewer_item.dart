import 'package:flutter/material.dart';
import 'package:hufi_vnvc_application/models/people_item_model.dart';

class PeopleItem extends StatelessWidget {
  final PeopleItemModel peopleItemModel;
  final Function onTab;
  const PeopleItem(
      {required this.peopleItemModel, required this.onTab, super.key});

  @override
  Widget build(BuildContext context) {
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
              CircleAvatar(
                  child: ClipRRect(
                borderRadius: BorderRadius.circular(45),
                child: Image.network(fit: BoxFit.fill, peopleItemModel.avatar),
              )),
              const SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Họ và tên: ${peopleItemModel.fullName}",
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                  Text(
                    "Tuổi: ${peopleItemModel.age}",
                    style: Theme.of(context).textTheme.bodySmall,
                  )
                ],
              )
            ],
          ),
        ));
  }
}
