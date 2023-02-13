import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hufi_vnvc_application/blocs/auth_bloc/login_bloc/login_bloc.dart';
import 'package:hufi_vnvc_application/blocs/auth_bloc/login_bloc/login_event.dart';
import 'package:hufi_vnvc_application/blocs/auth_bloc/login_bloc/login_state.dart';
import 'package:hufi_vnvc_application/main.dart';
import 'package:hufi_vnvc_application/screens/Auth/code_verify.dart';
import 'package:hufi_vnvc_application/screens/Auth/forgot_password.dart';
import 'package:hufi_vnvc_application/screens/Auth/register.dart';
import 'package:hufi_vnvc_application/themes/color.dart';
import 'package:hufi_vnvc_application/utils/ToastWidget/toast_widget.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
      child: Padding(
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
              "Đăng nhập VNVC",
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
                "Dùng số điện thoại của Quý khách để đăng ký hoặc đăng nhập VNVC",
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
                create: (context) => LoginBloc(),
                child: BlocConsumer<LoginBloc, LoginState>(
                    listener: (context, state) {
                      if (state.loginResultState?.status ==
                          LoginStatus.success) {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => const RunFirstApp())));
                      } else if (state.loginResultState?.status ==
                          LoginStatus.notActive) {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => VerifyCodeScreen(
                                      username: state.userName!,
                                    )));
                      } else if (state.loginResultState?.status ==
                          LoginStatus.failed) {
                        fToast.showToast(
                            child: ToastWidget(
                                message: state.loginResultState!.message,
                                status: "error"));
                      }
                    },
                    builder: ((context, state) => Card(
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
                                    context.read<LoginBloc>().add(
                                        OnChangePhoneNumberEvent(
                                            phoneNumber: phone))
                                  },
                                  keyboardType: TextInputType.phone,
                                  decoration: InputDecoration(
                                      isDense: true,
                                      contentPadding:
                                          const EdgeInsets.symmetric(
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
                                TextField(
                                  style: const TextStyle(fontSize: 14),
                                  onChanged: (pwd) => {
                                    context.read<LoginBloc>().add(
                                        OnChangePasswordEvent(password: pwd))
                                  },
                                  obscureText: !state.isShowPassword,
                                  keyboardType: TextInputType.phone,
                                  decoration: InputDecoration(
                                      suffixIcon: GestureDetector(
                                        onTap: () => context
                                            .read<LoginBloc>()
                                            .add(OnShowPasswordEvent()),
                                        child: Icon(state.isShowPassword
                                            ? Icons.visibility_rounded
                                            : Icons.visibility_off_rounded),
                                      ),
                                      isDense: true,
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              vertical: 15, horizontal: 10),
                                      labelText: "Nhập mật khẩu",
                                      labelStyle: const TextStyle(fontSize: 12),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(8))),
                                ),
                                if (state.loginResultState?.status ==
                                    LoginStatus.failed)
                                  Text(
                                    state.loginResultState!.message,
                                    style: const TextStyle(
                                        color: Colors.red, fontSize: 13),
                                  ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    TextButton(
                                        style: ButtonStyle(
                                            overlayColor:
                                                MaterialStateProperty.all(
                                                    Colors.transparent)),
                                        onPressed: () => Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const ForgotPasswordScreen())),
                                        child: const Text(
                                          "Quên mật khẩu?",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 13),
                                        )),
                                    TextButton(
                                        style: ButtonStyle(
                                            overlayColor:
                                                MaterialStateProperty.all(
                                                    Colors.transparent)),
                                        onPressed: () =>
                                            Navigator.pushReplacement(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        const RegisterScreen())),
                                        child: const Text("Đăng ký tài khoản",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 13)))
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                ElevatedButton(
                                    onPressed: state.loginResultState?.status ==
                                            LoginStatus.loading
                                        ? null
                                        : () async {
                                            final fcmToken =
                                                await FirebaseMessaging.instance
                                                    .getToken();
                                            print(fcmToken);
                                            // ignore: use_build_context_synchronously
                                            context.read<LoginBloc>().add(
                                                OnClickLoginEvent(
                                                    fcmToken: fcmToken));
                                          },
                                    style: ElevatedButton.styleFrom(
                                        disabledForegroundColor: Colors.white,
                                        disabledBackgroundColor:
                                            const Color.fromARGB(
                                                255, 127, 151, 213),
                                        backgroundColor: ColorTheme.primary,
                                        minimumSize: const Size.fromHeight(40)),
                                    child: (state.loginResultState?.status ==
                                            LoginStatus.loading)
                                        ? LoadingAnimationWidget
                                            .fourRotatingDots(
                                                color: ColorTheme.primary,
                                                size: 24)
                                        : const Text("Đăng nhập")),
                              ],
                            ),
                          ),
                        ))))
          ],
        ),
      ),
    );
  }
}
