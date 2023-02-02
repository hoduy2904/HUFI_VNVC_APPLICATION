import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hufi_vnvc_application/blocs/vaccine_bloc/vaccine_package_bloc/vaccine_package_bloc.dart';
import 'package:hufi_vnvc_application/blocs/vaccine_bloc/vaccine_package_bloc/vaccine_package_state.dart';
import 'package:hufi_vnvc_application/models/vaccine_package_model.dart';
import 'package:hufi_vnvc_application/screens/vaccine/vaccine_detail.dart';
import 'package:hufi_vnvc_application/themes/color.dart';

class VaccinePackageItem extends StatelessWidget {
  final VaccinePackageModel vaccinePackage;
  const VaccinePackageItem(this.vaccinePackage, {super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VaccinePackageBloc, VaccinePackageState>(
        builder: ((context, state) => Container(
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
                  InkWell(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => VaccineDetailsScreen(
                                packageId: vaccinePackage.id)))),
                    child: Stack(
                      children: [
                        Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(
                                    width: 4, color: ColorTheme.primary)),
                            child: Image.asset(
                              "assets/image/vaccineDefault.jpg",
                              fit: BoxFit.fitWidth,
                              height: 140,
                              width: double.infinity,
                            )),
                        Positioned(
                            bottom: 3,
                            left: 2,
                            child: Container(
                              color: ColorTheme.primary,
                              padding: const EdgeInsets.all(3),
                              child: Text(
                                vaccinePackage.name,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    decoration: TextDecoration.none),
                              ),
                            )),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 15, bottom: 0, left: 10, right: 15),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          InkWell(
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) => VaccineDetailsScreen(
                                        packageId: vaccinePackage.id)))),
                            child: Column(
                              children: [
                                Container(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    vaccinePackage.name,
                                    style:
                                        Theme.of(context).textTheme.bodyText1,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    "Liên hệ",
                                    style: TextStyle(
                                        color: ColorTheme.primary,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                )
                              ],
                            ),
                          ),
                          OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8)),
                                  minimumSize: const Size.fromHeight(45),
                                  side: BorderSide(
                                      color: ColorTheme.primary, width: 1.0)),
                              onPressed: null,
                              child: Text(
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: ColorTheme.primary),
                                  "Liên hệ")),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )));
  }
}
