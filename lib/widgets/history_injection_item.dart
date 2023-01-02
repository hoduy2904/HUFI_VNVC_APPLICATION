import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_application_1/models/history_injection_model.dart';

class HistoryInjectionItem extends StatelessWidget {
  final HistoryInjectionModel model;
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
                    DateFormat("dd/MM/yyyy").format(model.timeInjection),
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
                        model.isPay ? "Đã thanh toán" : "Chưa thanh toán",
                        style: TextStyle(
                            color: model.isPay
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
                    Text(model.bookingCode,
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
                      "Tên vắc xin",
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    Text(model.vaccineName,
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
                      "Tổng tiền",
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    Text(NumberFormat("#,##0", "vi-VN").format(model.total),
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
                    Text(DateFormat("dd/MM/yyyy").format(model.appointmentDate),
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
                    !model.isPay
                        ? ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue.shade800),
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
                              color: Colors.blue.shade800,
                            ),
                            backgroundColor: Colors.white),
                        onPressed: (() {}),
                        child: Text(
                          "Chi tiết",
                          style: TextStyle(
                              color: Colors.blue.shade800,
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
