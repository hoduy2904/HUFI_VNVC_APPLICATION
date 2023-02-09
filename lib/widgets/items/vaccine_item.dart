import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hufi_vnvc_application/blocs/cart_bloc/cart_bloc.dart';
import 'package:hufi_vnvc_application/blocs/cart_bloc/cart_event.dart';
import 'package:hufi_vnvc_application/blocs/cart_bloc/cart_state.dart';
import 'package:hufi_vnvc_application/blocs/vaccine_bloc/vaccine_state.dart';
import 'package:hufi_vnvc_application/blocs/vaccine_bloc/vacicne_bloc.dart';
import 'package:hufi_vnvc_application/screens/vaccine/vaccine_detail.dart';
import 'package:hufi_vnvc_application/themes/color.dart';
import 'package:intl/intl.dart';

import '../../models/vaccine_model.dart';

class VaccineItem extends StatelessWidget {
  final VaccineModel vaccine;
  const VaccineItem(this.vaccine, {super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => VaccineBloc(),
        child: BlocBuilder<VaccineBloc, VaccineState>(
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
                      border:
                          Border.all(width: 1.0, color: Colors.grey.shade300)),
                  child: Column(
                    children: [
                      InkWell(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => VaccineDetailsScreen(
                                    vaccineId: vaccine.id)))),
                        child: Stack(
                          children: [
                            Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(
                                        width: 4, color: ColorTheme.primary)),
                                child: vaccine.images.isEmpty
                                    ? Image.asset(
                                        "assets/image/vaccineDefault.jpg",
                                        fit: BoxFit.fitWidth,
                                        height: 140,
                                        width: double.infinity,
                                      )
                                    : Image.network(vaccine.images,
                                        fit: BoxFit.fitWidth,
                                        height: 140,
                                        width: double.infinity)),
                            Positioned(
                                bottom: 3,
                                left: 2,
                                child: Container(
                                  color: ColorTheme.primary,
                                  padding: const EdgeInsets.all(3),
                                  child: Text(
                                    vaccine.name,
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                        decoration: TextDecoration.none),
                                  ),
                                )),
                            if (vaccine.price < vaccine.priceOld)
                              Positioned(
                                  top: 5,
                                  left: 2,
                                  child: Container(
                                    color: Colors.red,
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 5, horizontal: 10),
                                    child: Text(
                                      "${((vaccine.price - vaccine.priceOld) / vaccine.priceOld) * 100}%",
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
                                        builder: ((context) =>
                                            VaccineDetailsScreen(
                                                vaccineId: vaccine.id)))),
                                child: Column(
                                  children: [
                                    Container(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                        vaccine.name,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1,
                                      ),
                                    ),
                                    Container(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        maxLines: 2,
                                        "Phòng bệnh: ${vaccine.prevention}",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        vaccine.price < 1
                                            ? "Liên hệ"
                                            : "${NumberFormat("#,##0", "vi-VN").format(vaccine.price)}đ",
                                        style: TextStyle(
                                            color: ColorTheme.primary,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              BlocBuilder<CartBloc, CartState>(
                                  builder: ((context, state) => OutlinedButton(
                                      style: OutlinedButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8)),
                                          minimumSize:
                                              const Size.fromHeight(45),
                                          side: BorderSide(
                                              color: vaccine.quantityRemain < 1
                                                  ? Colors.red
                                                  : ColorTheme.primary,
                                              width: 1.0)),
                                      onPressed: () => {
                                            vaccine.price < 1
                                                ? null
                                                : context.read<CartBloc>().add(
                                                    OnAddCartEvent(
                                                        idProduct: vaccine.id))
                                          },
                                      child: Text(
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: ColorTheme.primary),
                                          vaccine.price > 0 &&
                                                  vaccine.quantityRemain > 0
                                              ? "Chọn mua"
                                              : vaccine.quantityRemain < 1
                                                  ? "Hết hàng"
                                                  : "Liên hệ")))),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ))));
  }
}
