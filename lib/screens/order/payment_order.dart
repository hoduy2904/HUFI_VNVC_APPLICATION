import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hufi_vnvc_application/blocs/cart_bloc/cart_bloc.dart';
import 'package:hufi_vnvc_application/blocs/cart_bloc/cart_event.dart';
import 'package:hufi_vnvc_application/blocs/cart_bloc/cart_state.dart';
import 'package:hufi_vnvc_application/blocs/order_bloc/payment_order_bloc/payment_order_bloc.dart';
import 'package:hufi_vnvc_application/blocs/order_bloc/payment_order_bloc/payment_order_event.dart';
import 'package:hufi_vnvc_application/blocs/order_bloc/payment_order_bloc/payment_order_state.dart';
import 'package:hufi_vnvc_application/main.dart';
import 'package:hufi_vnvc_application/screens/home/home_page.dart';
import 'package:hufi_vnvc_application/themes/color.dart';
import 'package:hufi_vnvc_application/widgets/items/vaccine_cart_item.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class PaymentOrder extends StatelessWidget {
  final int selectId;
  final Function onPay;
  const PaymentOrder({required this.selectId, required this.onPay, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 10),
                alignment: Alignment.topLeft,
                child: const Text(
                  "Chọn vắc xin cho người tiêm",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.none,
                      fontSize: 14,
                      color: Colors.black),
                ),
              ),
              Container(
                alignment: Alignment.topLeft,
                margin: const EdgeInsets.only(bottom: 10),
                child: Text(
                  "Mỗi \"Người được tiêm\" có thể đặt mua 03 loại vắc xin khác nhau và mỗi loại 01 liều vắc xin",
                  style: Theme.of(context).textTheme.bodyText2,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        minimumSize: const Size.fromHeight(45),
                        backgroundColor: Colors.white,
                        textStyle: TextStyle(color: ColorTheme.primary),
                        side: BorderSide(color: ColorTheme.primaryStrong)),
                    onPressed: () => Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => const MyApp()))),
                    child: Text(
                      "Thêm hoặc xoá vắc xin",
                      style: TextStyle(
                          color: ColorTheme.primaryStrong,
                          fontWeight: FontWeight.bold),
                    )),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 10),
                alignment: Alignment.topLeft,
                child: const Text(
                  "Danh sách vắc xin đã chọn",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.none,
                      fontSize: 14,
                      color: Colors.black),
                ),
              ),
              BlocProvider(
                  create: (context) => CartBloc()..add(OnLoadCartEvent()),
                  child: BlocBuilder<CartBloc, CartState>(
                      builder: ((context, state) {
                    if (state is CartLoadingState) {
                      return Center(
                        child: LoadingAnimationWidget.fourRotatingDots(
                            color: ColorTheme.primary, size: 24),
                      );
                    } else if (state is CartSuccessState) {
                      if (state.carts.isEmpty) {
                        return const Center(
                          child: Text("Giỏ hàng trống"),
                        );
                      } else {
                        return Column(
                          children: state.carts
                              .map((e) =>
                                  VaccineCartItem(model: e.vaccineModel!))
                              .toList(),
                        );
                      }
                    } else if (state is CartFailedState) {
                      return Center(
                        child: Text(state.error),
                      );
                    } else {
                      return const Center(
                        child: Text("Vui lòng thử lại"),
                      );
                    }
                  }))),
              const SizedBox(
                height: 20,
              ),
              BlocProvider(
                  create: (context) => PaymentOrderBloc(),
                  child: BlocConsumer<PaymentOrderBloc, PaymentOrderState>(
                      listener: (context, state) {
                        if (state is PaymentOrderResultState) {
                          onPay(state.isSuccess, state.messsage);
                        }
                      },
                      builder: ((context, state) => ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              minimumSize: const Size.fromHeight(45)),
                          onPressed: () {
                            (state is PaymentOrderLoadingState)
                                ? null
                                : context
                                    .read<PaymentOrderBloc>()
                                    .add(OnPayClickEvent(selectId: selectId));
                          },
                          child: (state is PaymentOrderLoadingState)
                              ? LoadingAnimationWidget.fourRotatingDots(
                                  color: ColorTheme.primary, size: 24)
                              : const Text("Đặt hàng")))))
            ],
          )
        ],
      ),
    );
  }
}
