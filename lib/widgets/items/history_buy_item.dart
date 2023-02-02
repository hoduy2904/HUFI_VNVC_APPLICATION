import 'package:flutter/material.dart';
import 'package:hufi_vnvc_application/models/history_buy_model.dart';
import 'package:hufi_vnvc_application/models/injection_schedule.dart';
import 'package:hufi_vnvc_application/themes/color.dart';
import 'package:intl/intl.dart';

class HistoryInjectionItem extends StatelessWidget {
  final InjectionScheduleModel model;
  const HistoryInjectionItem(this.model, {super.key});

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
                    DateFormat("dd/MM/yyyy").format(model.date),
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
                        !model.checkPay ? "Đã thanh toán" : "Chưa thanh toán",
                        style: TextStyle(
                            color: !model.checkPay
                                ? Colors.green.shade600
                                : Colors.red,
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
                      "Mã booking",
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    Text("#${model.id}",
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
                const SizedBox(
                  height: 10,
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
                    Text(DateFormat("dd/MM/yyyy").format(model.date),
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
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    model.checkPay
                        ? ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: ColorTheme.primary),
                            onPressed: (() {}),
                            child: const Text(
                              "Thanh toán",
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ))
                        : const SizedBox(),
                    const SizedBox(
                      width: 10,
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            side: BorderSide(
                              color: ColorTheme.primary,
                            ),
                            backgroundColor: Colors.white),
                        onPressed: (() {}),
                        child: Text(
                          "Chi tiết",
                          style: TextStyle(
                              color: ColorTheme.primary,
                              fontWeight: FontWeight.bold),
                        ))
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
