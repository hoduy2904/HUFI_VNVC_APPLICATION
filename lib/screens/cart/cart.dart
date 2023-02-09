import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hufi_vnvc_application/blocs/cart_bloc/cart_bloc.dart';
import 'package:hufi_vnvc_application/blocs/cart_bloc/cart_event.dart';
import 'package:hufi_vnvc_application/blocs/cart_bloc/cart_state.dart';
import 'package:hufi_vnvc_application/models/cart_model.dart';
import 'package:hufi_vnvc_application/screens/order/order.dart';
import 'package:hufi_vnvc_application/themes/color.dart';
import 'package:hufi_vnvc_application/themes/typography.dart';
import 'package:intl/intl.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: ColorTheme.primary,
          title: Text(
            "Giỏ hàng",
            style: TypographyTheme.titleBar,
          ),
          centerTitle: true,
        ),
        bottomNavigationBar: ElevatedButton(
            style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(45)),
            onPressed: () => {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const OrderScreen()))
                },
            child: const Text("Đặt mua")),
        body: BlocProvider(
            create: (context) => CartBloc()..add(OnLoadCartEvent()),
            child: BlocBuilder<CartBloc, CartState>(builder: ((context, state) {
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
                  return SingleChildScrollView(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          Column(
                            children: state.carts
                                .map((model) => CartItem(
                                    context,
                                    model,
                                    (e) => {
                                          context.read<CartBloc>().add(
                                              OnRemoveCartItem(idProduct: e))
                                        }))
                                .toList(),
                          )
                        ],
                      ));
                }
              } else if (state is CartFailedState) {
                return Center(
                  child: Text(state.error),
                );
              } else {
                return const SizedBox();
              }
            }))));
  }
}

Widget CartItem(BuildContext context, CartModel model, Function onTap) {
  var formatMoney = NumberFormat("#,##0", "vi_VN");
  return Card(
      margin: const EdgeInsets.symmetric(vertical: 10),
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
                        image: AssetImage("assets/image/defaultCart.jpg")),
                    color: Colors.blue.shade100,
                    borderRadius: BorderRadius.circular(5)),
                child: Container(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        model.vaccineModel!.name.toUpperCase(),
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
                        "Phòng bệnh: ${model.vaccineModel?.prevention}",
                        style: Theme.of(context).textTheme.bodySmall,
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    alignment: Alignment.bottomRight,
                    child: Text(
                      "${formatMoney.format(model.vaccineModel?.price)} VNĐ",
                      style: TextStyle(
                          color: ColorTheme.primaryStrong,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                  ),
                  IconButton(
                      onPressed: () => onTap(model.id),
                      icon: const Icon(
                        Icons.delete_outline_outlined,
                        color: Colors.red,
                      ))
                ],
              )
            ],
          ),
        ),
      ));
}
