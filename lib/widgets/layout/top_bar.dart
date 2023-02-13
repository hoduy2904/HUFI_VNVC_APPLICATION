import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hufi_vnvc_application/blocs/auth_bloc/auth_bloc.dart';
import 'package:hufi_vnvc_application/blocs/auth_bloc/auth_state.dart';
import 'package:hufi_vnvc_application/blocs/cart_bloc/cart_bloc.dart';
import 'package:hufi_vnvc_application/blocs/cart_bloc/cart_event.dart';
import 'package:hufi_vnvc_application/blocs/cart_bloc/cart_state.dart';
import 'package:hufi_vnvc_application/screens/cart/cart.dart';
import 'package:hufi_vnvc_application/screens/notification/notification.dart';
import 'package:hufi_vnvc_application/themes/color.dart';

class TopAppBar extends StatelessWidget with PreferredSizeWidget {
  const TopAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<CartBloc>().add(OnLoadCartEvent());
    return AppBar(
      elevation: 0,
      backgroundColor: ColorTheme.primary,
      centerTitle: true,
      title: BlocBuilder<AuthBloc, AuthState>(
          builder: ((context, state) => Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: (state is AuthenticationState &&
                            state.user.avatar != null)
                        ? Image.network(
                            state.user.avatar!,
                            width: 35,
                            height: 35,
                          )
                        : Image.asset(
                            "assets/image/avatar.png",
                            width: 35,
                            height: 35,
                          ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Column(
                      children: [
                        Text(
                            "Chào buổi ${DateTime.now().hour > 12 ? "Chiều" : "Sáng"}",
                            style: const TextStyle(
                                fontSize: 12, color: Colors.white)),
                        Text(
                          (state is AuthenticationState)
                              ? "${state.user.lastName} ${state.user.firstName}"
                              : "Khách",
                          style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        )
                      ],
                    ),
                  )
                ],
              ))),
      leading: IconButton(
          onPressed: () => {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const NotificationScreen()))
              },
          icon: const Icon(
            Icons.notifications,
            color: Colors.white,
          )),
      actions: [
        IconButton(
            onPressed: () => {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CartScreen()))
                },
            icon: Stack(
              children: [
                const Icon(
                  Icons.shopping_bag_outlined,
                  color: Colors.white,
                ),
                BlocBuilder<CartBloc, CartState>(builder: ((context, state) {
                  return Positioned(
                    right: 0,
                    top: 0,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Text(
                          textAlign: TextAlign.center,
                          (state is CartSuccessState)
                              ? state.carts.length.toString()
                              : "0",
                          style: const TextStyle(fontSize: 10),
                        ),
                      ),
                    ),
                  );
                }))
              ],
            ))
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
