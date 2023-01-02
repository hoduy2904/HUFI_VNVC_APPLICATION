import 'package:flutter/material.dart';

import '../../models/vaccine_model.dart';

class VaccineItem extends StatelessWidget {
  final VaccineModel vaccine;
  const VaccineItem(this.vaccine, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 30),
      padding: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
          color: Colors.grey[200],
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 2))
          ],
          borderRadius: BorderRadius.circular(8),
          border: Border.all(width: 1.0, color: Colors.grey.shade300)),
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border:
                          Border.all(width: 4, color: Colors.blue.shade800)),
                  child: Image.network(vaccine.images)),
              Positioned(
                  bottom: 3,
                  left: 2,
                  child: Container(
                    color: Colors.blue[800],
                    padding: const EdgeInsets.all(3),
                    child: const Text(
                      "Vắc xin 4 trong 1",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          decoration: TextDecoration.none),
                    ),
                  )),
              Positioned(
                  top: 5,
                  left: 2,
                  child: Container(
                    color: Colors.red,
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: const Text(
                      "-50%",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          decoration: TextDecoration.none),
                    ),
                  )),
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 15, bottom: 0, left: 10, right: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    child: Text(
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      vaccine.name,
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Phòng bệnh",
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    child: Text(
                      vaccine.price.toString(),
                      style: TextStyle(
                          color: Colors.blue.shade800,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                  ),
                  OutlinedButton(
                      style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          minimumSize: const Size.fromHeight(45),
                          side: BorderSide(
                              color: Colors.blue.shade800, width: 1.0)),
                      onPressed: () => {},
                      child: Text(
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.blue.shade800),
                          "Chọn mua")),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
