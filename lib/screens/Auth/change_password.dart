import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hufi_vnvc_application/blocs/auth_bloc/change_password_bloc/change_password_bloc.dart';
import 'package:hufi_vnvc_application/blocs/auth_bloc/change_password_bloc/change_password_event.dart';
import 'package:hufi_vnvc_application/blocs/auth_bloc/change_password_bloc/change_password_state.dart';
import 'package:hufi_vnvc_application/screens/Auth/login.dart';
import 'package:hufi_vnvc_application/screens/profile/profile_infomation.dart';
import 'package:hufi_vnvc_application/themes/color.dart';
import 'package:hufi_vnvc_application/utils/ToastWidget/toast_widget.dart';
import 'package:hufi_vnvc_application/widgets/layout/top_bar.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    FToast fToast = FToast();
    fToast.init(context);
    return BlocProvider(
        create: (context) => ChangePasswordBloc(),
        child: BlocConsumer<ChangePasswordBloc, ChangePasswordState>(
            listener: (context, state) {
          if (state.passwordChangingState != null) {
            if (state.passwordChangingState?.isSuccess == true) {
              Navigator.pop(context);
            } else {
              fToast.showToast(
                  child: ToastWidget(
                      message: state.passwordChangingState!.message,
                      status: "error"));
            }
          }
        }, builder: (BuildContext context, state) {
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
                            border: Border.all(
                                width: 5, color: Colors.blue.shade200),
                            borderRadius: BorderRadius.circular(100)),
                        child: Image.asset(
                          "assets/icons/compliant.png",
                          scale: 8,
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const Text(
                        "Đổi mật khẩu",
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
                          "Đổi mật khẩu VNVC, bạn phải ghi nhớ mật khẩu, cần hỗ trợ hãy gọi hotline",
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
                      Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 30),
                            child: Form(
                              child: Column(
                                children: [
                                  TextFormField(
                                    obscureText: !state.isShowPassword,
                                    style: const TextStyle(fontSize: 14),
                                    onChanged: (pwd) => {
                                      context.read<ChangePasswordBloc>().add(
                                          OnChangeOldPasswordEvent(
                                              passsword: pwd))
                                    },
                                    keyboardType: TextInputType.visiblePassword,
                                    decoration: InputDecoration(
                                        errorText: state.isSubmit &&
                                                state.oldPasswordValidate
                                            ? "Mật khẩu cũ phải hơn 6 ký tự"
                                            : null,
                                        suffixIcon: GestureDetector(
                                          onTap: () => context
                                              .read<ChangePasswordBloc>()
                                              .add(OnShowOldPasswordEvent()),
                                          child: Icon(state.isShowOldPassword
                                              ? Icons.visibility_rounded
                                              : Icons.visibility_off_rounded),
                                        ),
                                        isDense: true,
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                                vertical: 15, horizontal: 10),
                                        hintText: "Mật khẩu cũ",
                                        labelStyle:
                                            const TextStyle(fontSize: 12),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(8))),
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  TextFormField(
                                    obscureText: !state.isShowPassword,
                                    style: const TextStyle(fontSize: 14),
                                    onChanged: (pwd) => {
                                      context.read<ChangePasswordBloc>().add(
                                          OnChangePasswordEvent(passsword: pwd))
                                    },
                                    keyboardType: TextInputType.visiblePassword,
                                    decoration: InputDecoration(
                                        errorText: state.isSubmit &&
                                                state.passwordValidate
                                            ? "Mật khẩu phải hơn 6 ký tự"
                                            : null,
                                        suffixIcon: GestureDetector(
                                          onTap: () => context
                                              .read<ChangePasswordBloc>()
                                              .add(OnShowPasswordEvent()),
                                          child: Icon(state.isShowPassword
                                              ? Icons.visibility_rounded
                                              : Icons.visibility_off_rounded),
                                        ),
                                        isDense: true,
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                                vertical: 15, horizontal: 10),
                                        hintText: "Mật khẩu",
                                        labelStyle:
                                            const TextStyle(fontSize: 12),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(8))),
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  TextFormField(
                                    obscureText: !state.isShowRepeatPassword,
                                    style: const TextStyle(fontSize: 14),
                                    onChanged: (pwd) => {
                                      context.read<ChangePasswordBloc>().add(
                                          OnChangePasswordRepeatEvent(
                                              passswordRepeat: pwd))
                                    },
                                    keyboardType: TextInputType.visiblePassword,
                                    decoration: InputDecoration(
                                        errorText: state.isSubmit &&
                                                state.passwordRepeatValidate
                                            ? "Không giống mật khẩu"
                                            : null,
                                        suffixIcon: GestureDetector(
                                          onTap: () => context
                                              .read<ChangePasswordBloc>()
                                              .add(OnShowRepeatPasswordEvent()),
                                          child: Icon(state.isShowRepeatPassword
                                              ? Icons.visibility_rounded
                                              : Icons.visibility_off_rounded),
                                        ),
                                        isDense: true,
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                                vertical: 15, horizontal: 10),
                                        hintText: "xác thực mật khẩu",
                                        labelStyle:
                                            const TextStyle(fontSize: 12),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(8))),
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  ElevatedButton(
                                      onPressed: (!state.passwordValidate ||
                                              !state.passwordRepeatValidate)
                                          ? null
                                          : (() => {
                                                context
                                                    .read<ChangePasswordBloc>()
                                                    .add(
                                                        OnClickChangePassEvent())
                                              }),
                                      style: ElevatedButton.styleFrom(
                                          disabledForegroundColor: Colors.white,
                                          disabledBackgroundColor:
                                              const Color.fromARGB(
                                                  255, 127, 151, 213),
                                          backgroundColor: ColorTheme.primary,
                                          minimumSize:
                                              const Size.fromHeight(40)),
                                      child: const Text("Đổi mật khẩu")),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                ],
                              ),
                            )),
                      )
                    ],
                  ),
                ),
              ));
        }));
  }
}
