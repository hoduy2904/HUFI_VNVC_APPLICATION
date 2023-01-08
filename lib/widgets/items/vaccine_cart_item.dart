import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hufi_vnvc_application/models/vaccine_model.dart';
import 'package:intl/intl.dart';

class VaccineCartItem extends StatelessWidget {
  final VaccineModel model;
  const VaccineCartItem({required this.model, super.key});

  @override
  Widget build(BuildContext context) {
    var formatMoney = NumberFormat("#,##0", "vi_VN");
    return Card(
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
                Container(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    "${formatMoney.format(model.price)} VNĐ",
                    style: TextStyle(
                        color: Colors.blue.shade900,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
