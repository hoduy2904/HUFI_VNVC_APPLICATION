import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hufi_vnvc_application/blocs/auth_bloc/register_bloc/register_bloc.dart';
import 'package:hufi_vnvc_application/blocs/auth_bloc/register_bloc/register_event.dart';
import 'package:hufi_vnvc_application/blocs/auth_bloc/register_bloc/register_state.dart';
import 'package:hufi_vnvc_application/screens/profile/profile_infomation.dart';
import 'package:hufi_vnvc_application/themes/color.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
              "Nhập số điện thoại",
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
                "Dùng số điện thoại của Quý khách để đăng ký VNVC",
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
                create: (context) => RegisterBloc(),
                child: BlocConsumer<RegisterBloc, RegisterState>(
                    listener: (context, state) {
                      if (state.registerResultState?.status ==
                          RegisterStatus.Success) {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: ((context) =>
                                    const ProfileInfomationScreen())));
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
                                    context.read<RegisterBloc>().add(
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
                                    context.read<RegisterBloc>().add(
                                        OnChangePasswordEvent(password: pwd))
                                  },
                                  obscureText: !state.isShowPassword,
                                  keyboardType: TextInputType.phone,
                                  decoration: InputDecoration(
                                      suffixIcon: GestureDetector(
                                        onTap: () => context
                                            .read<RegisterBloc>()
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
                                if (state.registerResultState?.status ==
                                    RegisterStatus.Failed)
                                  Text(
                                    state.registerResultState!.message,
                                    style: const TextStyle(
                                        color: Colors.red, fontSize: 13),
                                  ),
                                const SizedBox(
                                  height: 15,
                                ),
                                TextField(
                                  style: const TextStyle(fontSize: 14),
                                  onChanged: (pwd) => {
                                    context.read<RegisterBloc>().add(
                                        OnChangeRepeatPasswordEvent(
                                            password: pwd))
                                  },
                                  obscureText: !state.isShowRepeatPassword,
                                  keyboardType: TextInputType.phone,
                                  decoration: InputDecoration(
                                      suffixIcon: GestureDetector(
                                        onTap: () => context
                                            .read<RegisterBloc>()
                                            .add(OnShowRepeatPasswordEvent()),
                                        child: Icon(state.isShowRepeatPassword
                                            ? Icons.visibility_rounded
                                            : Icons.visibility_off_rounded),
                                      ),
                                      isDense: true,
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              vertical: 15, horizontal: 10),
                                      labelText: "Xác thực mật khẩu",
                                      labelStyle: const TextStyle(fontSize: 12),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(8))),
                                ),
                                if (state.registerResultState?.status ==
                                    RegisterStatus.Failed)
                                  Text(
                                    state.registerResultState!.message,
                                    style: const TextStyle(
                                        color: Colors.red, fontSize: 13),
                                  ),
                                const SizedBox(
                                  height: 15,
                                ),
                                ElevatedButton(
                                    onPressed: () => context
                                        .read<RegisterBloc>()
                                        .add(OnClickRegisterEvent()),
                                    style: ElevatedButton.styleFrom(
                                        disabledForegroundColor: Colors.white,
                                        disabledBackgroundColor:
                                            const Color.fromARGB(
                                                255, 127, 151, 213),
                                        backgroundColor: ColorTheme.primary,
                                        minimumSize: const Size.fromHeight(40)),
                                    child: (state.registerResultState?.status ==
                                            RegisterStatus.Loading)
                                        ? LoadingAnimationWidget
                                            .fourRotatingDots(
                                                color: ColorTheme.primary,
                                                size: 24)
                                        : const Text("Tiếp tục"))
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
