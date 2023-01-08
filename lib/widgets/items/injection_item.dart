import 'package:flutter/material.dart';
import 'package:hufi_vnvc_application/models/injection_model.dart';
import 'package:intl/intl.dart';

class InjectionItem extends StatelessWidget {
  final InjectionModel model;
  const InjectionItem({required this.model, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 5),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey.shade300))),
      child: Wrap(
        spacing: 30,
        children: [
          Column(
            children: [
              Text(
                DateFormat("hh:mm").format(model.dateTime),
                style: Theme.of(context).textTheme.bodySmall,
              ),
              Text(
                DateFormat("dd/MM/yyyy").format(model.dateTime),
                style: Theme.of(context).textTheme.bodyText1,
              ),
              Text(
                "Mũi ${model.number}",
                style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.none,
                    color: Colors.black),
              )
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                model.location,
                style: Theme.of(context).textTheme.bodySmall,
              ),
              Text(
                model.vaccineName,
                style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.none,
                    color: Colors.black),
              ),
              Text(
                model.preventive,
                style: Theme.of(context).textTheme.bodySmall,
              )
            ],
          )
        ],
      ),
    );
  }
}
