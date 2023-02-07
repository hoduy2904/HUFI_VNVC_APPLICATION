import 'package:flutter/material.dart';
import 'package:hufi_vnvc_application/models/injection_schedule_details.dart';
import 'package:intl/intl.dart';

class HistoryInjectionDetailsItem extends StatelessWidget {
  final InjectionScheduleDetails model;
  const HistoryInjectionDetailsItem(this.model, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                color: Colors.blue.shade800,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10))),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    model.injectionTime == null
                        ? "Chưa có lịch"
                        : DateFormat("dd/MM/yyyy").format(model.injectionTime!),
                    style: const TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.none),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 6, horizontal: 15),
                      child: Text(
                        model.pay ? "Đã thanh toán" : "Chưa thanh toán",
                        style: TextStyle(
                            color:
                                model.pay ? Colors.green.shade600 : Colors.red,
                            fontSize: 14,
                            decoration: TextDecoration.none),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Tên vắc xin",
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    Text("${model.vaccineName}",
                        style: const TextStyle(
                            color: Colors.black,
                            decoration: TextDecoration.none,
                            fontWeight: FontWeight.bold,
                            fontSize: 13)),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Lô hàng",
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    Text("${model.shipmentCode}",
                        style: const TextStyle(
                            color: Colors.black,
                            decoration: TextDecoration.none,
                            fontWeight: FontWeight.bold,
                            fontSize: 13)),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Ngày hẹn tiêm",
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    Text(
                        model.injectionTime == null
                            ? "Chưa có"
                            : DateFormat("dd/MM/yyyy")
                                .format(model.injectionTime!),
                        style: const TextStyle(
                            color: Colors.black,
                            decoration: TextDecoration.none,
                            fontWeight: FontWeight.bold,
                            fontSize: 13)),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
