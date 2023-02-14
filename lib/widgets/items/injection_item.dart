import 'package:flutter/material.dart';
import 'package:hufi_vnvc_application/models/injection_schedule_details.dart';
import 'package:intl/intl.dart';

class InjectionItem extends StatelessWidget {
  final InjectionScheduleDetails model;
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
              if (model.scheduleTime != null) ...[
                Text(
                  DateFormat("hh:mm").format(model.scheduleTime!),
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                Text(
                  DateFormat("dd/MM/yyyy").format(model.scheduleTime!),
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ],
              Text(
                "Mũi ${model.injections}",
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
                model.address,
                style: Theme.of(context).textTheme.bodySmall,
              ),
              Text(
                model.vaccineName ?? model.vaccinePackageName ?? "",
                style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.none,
                    color: Colors.black),
              ),
            ],
          )
        ],
      ),
    );
  }
}
