import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hufi_vnvc_application/blocs/auth_bloc/forgot_password_bloc/forgot_password_bloc.dart';
import 'package:hufi_vnvc_application/blocs/auth_bloc/forgot_password_bloc/forgot_password_event.dart';
import 'package:hufi_vnvc_application/blocs/auth_bloc/forgot_password_bloc/forgot_password_state.dart';
import 'package:hufi_vnvc_application/themes/color.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    FToast fToast = FToast();
    fToast.init(context);
    return Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
              const Color.fromARGB(255, 9, 39, 208),
              Colors.blue.shade300
            ])),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 60,
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(width: 5, color: Colors.blue.shade200),
                      borderRadius: BorderRadius.circular(100)),
                  child: Image.asset(
                    "assets/icons/approved.png",
                    scale: 1.7,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  "Quên mật khẩu tài khoản VNVC",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      decoration: TextDecoration.none),
                ),
                const SizedBox(
                  height: 5,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: Text(
                    textAlign: TextAlign.center,
                    "Dùng số điện thoại của Quý khách đã đăng ký VNVC",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.normal,
                        fontSize: 12,
                        decoration: TextDecoration.none),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                BlocProvider(
                    create: (context) => ForgotBloc(),
                    child: BlocBuilder<ForgotBloc, ForgotPasswordState>(
                        builder: ((context, state) {
                      if (state.status == ForgotPasswordStatus.success) {
                        return Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20.0, vertical: 30),
                                child: Column(children: [
                                  const Text(
                                    "Thành công",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  const Text(
                                    "Khôi phục mật khẩu thành công, vui lòng kiểm tra đường link trong tin nhắn",
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  ElevatedButton(
                                      onPressed: () => Navigator.pop(context),
                                      child: const Text("Đăng nhập"))
                                ])));
                      }
                      return Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 30),
                          child: Column(
                            children: [
                              TextField(
                                style: const TextStyle(fontSize: 14),
                                onChanged: (phone) => {
                                  context.read<ForgotBloc>().add(
                                      OnChangePhoneNumber(phoneNumber: phone))
                                },
                                keyboardType: TextInputType.phone,
                                decoration: InputDecoration(
                                    isDense: true,
                                    contentPadding: const EdgeInsets.symmetric(
                                        vertical: 15, horizontal: 10),
                                    labelText: "Nhập số điện thoại của bạn",
                                    labelStyle: const TextStyle(fontSize: 12),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(8))),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              if (state.status == ForgotPasswordStatus.error)
                                Text(
                                  state.message,
                                  style: const TextStyle(
                                      color: Colors.red, fontSize: 13),
                                ),
                              const SizedBox(
                                height: 5,
                              ),
                              ElevatedButton(
                                  onPressed: () async {
                                    context
                                        .read<ForgotBloc>()
                                        .add(OnSubmitForgotEvent());
                                  },
                                  style: ElevatedButton.styleFrom(
                                      disabledForegroundColor: Colors.white,
                                      disabledBackgroundColor:
                                          const Color.fromARGB(
                                              255, 127, 151, 213),
                                      backgroundColor: ColorTheme.primary,
                                      minimumSize: const Size.fromHeight(40)),
                                  child: (state.status ==
                                          ForgotPasswordStatus.loading)
                                      ? LoadingAnimationWidget.fourRotatingDots(
                                          color: ColorTheme.primary, size: 24)
                                      : const Text("Khôi phục mật khẩu")),
                              const SizedBox(
                                height: 15,
                              ),
                            ],
                          ),
                        ),
                      );
                    })))
              ],
            ),
          ),
        ));
  }
}
