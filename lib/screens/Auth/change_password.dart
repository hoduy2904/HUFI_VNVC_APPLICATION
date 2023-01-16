import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hufi_vnvc_application/blocs/auth_bloc/change_password_bloc/change_password_bloc.dart';
import 'package:hufi_vnvc_application/blocs/auth_bloc/change_password_bloc/change_password_event.dart';
import 'package:hufi_vnvc_application/blocs/auth_bloc/change_password_bloc/change_password_state.dart';
import 'package:hufi_vnvc_application/themes/color.dart';
import 'package:hufi_vnvc_application/themes/typography.dart';
import 'package:hufi_vnvc_application/utils/ToastWidget/toast_widget.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    FToast fToast = FToast();
    fToast.init(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorTheme.primary,
        title: Text(
          "Doi mat khau",
          style: TypographyTheme.titleBar,
        ),
      ),
      body: BlocProvider(
          create: (context) => ChangePasswordBloc(),
          child: BlocBuilder<ChangePasswordBloc, ChangePasswordState>(
              builder: ((context, state) {
            return Column(children: [
              TextFormField(
                obscureText: !state.isShowPassword,
                style: const TextStyle(fontSize: 14),
                onChanged: (pwd) => {
                  context
                      .read<ChangePasswordBloc>()
                      .add(OnChangePasswordEvent(passsword: pwd))
                },
                keyboardType: TextInputType.visiblePassword,
                decoration: InputDecoration(
                    errorText: !state.passwordValidate && state.isSubmit
                        ? 'Mật khẩu phải có 6 ký tự'
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
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 10),
                    hintText: "Mật khẩu",
                    labelStyle: const TextStyle(fontSize: 12),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8))),
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                obscureText: !state.isShowRepeatPassword,
                style: const TextStyle(fontSize: 14),
                onChanged: (pwd) => {
                  context
                      .read<ChangePasswordBloc>()
                      .add(OnChangePasswordRepeatEvent(passswordRepeat: pwd))
                },
                keyboardType: TextInputType.visiblePassword,
                decoration: InputDecoration(
                    errorText: state.isSubmit && !state.passwordRepeatValidate
                        ? "Mật khẩu xac thuc phải có 6 ký tự"
                        : state.isSubmit && !state.confirmValidate
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
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 10),
                    hintText: "xác thực mật khẩu",
                    labelStyle: const TextStyle(fontSize: 12),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8))),
              ),
              const SizedBox(
                height: 15,
              ),
              ElevatedButton(
                  onPressed: () => {
                        context
                            .read<ChangePasswordBloc>()
                            .add(OnClickChangePassEvent()),
                        if (state.passwordChangingState?.isSuccess == true)
                          {Navigator.pop(context)}
                        else
                          {
                            fToast.showToast(
                                child: ToastWidget(
                                    message:
                                        state.passwordChangingState!.message,
                                    status: "error"))
                          }
                      },
                  style: ElevatedButton.styleFrom(
                      disabledForegroundColor: Colors.white,
                      disabledBackgroundColor:
                          const Color.fromARGB(255, 127, 151, 213),
                      backgroundColor: ColorTheme.primary,
                      minimumSize: const Size.fromHeight(40)),
                  child: const Text("Tiếp tục")),
              const SizedBox(
                height: 20,
              ),
            ]);
          }))),
    );
  }
}
