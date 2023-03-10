import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hufi_vnvc_application/blocs/auth_bloc/code_verify_bloc/code_verify_bloc.dart';
import 'package:hufi_vnvc_application/blocs/auth_bloc/code_verify_bloc/code_verify_event.dart';
import 'package:hufi_vnvc_application/blocs/auth_bloc/code_verify_bloc/code_verify_state.dart';
import 'package:hufi_vnvc_application/screens/Auth/login.dart';
import 'package:hufi_vnvc_application/utils/ToastWidget/toast_widget.dart';
import 'package:hufi_vnvc_application/widgets/otp_form_widget.dart';

class VerifyCodeScreen extends StatefulWidget {
  final String username;
  const VerifyCodeScreen({required this.username, super.key});
  static const String route = "/auth/verifyCode";

  @override
  State<VerifyCodeScreen> createState() => _VerifyCodeScreenState();
}

class _VerifyCodeScreenState extends State<VerifyCodeScreen> {
  int Seconds = 20;
  Timer? timer;

  void startTime() {
    timer = Timer(
        const Duration(seconds: 1),
        () => {
              if (Seconds < 1)
                timer?.cancel()
              else
                {
                  setState(() {
                    Seconds--;
                  })
                }
            });
  }

  @override
  Widget build(BuildContext context) {
    FToast fToast = FToast();
    fToast.init(context);
    startTime();
    return Scaffold(
      body: Container(
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
                  "assets/icons/protected.png",
                  scale: 8,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                "X??c th???c s??? ??i???n tho???i",
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
                  "Nh???p m?? x??c th???c (OTP) ???????c g???i ?????n s??? ??i???n tho???i",
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
                  create: ((context) => CodeVerifyBloc()),
                  child: BlocConsumer<CodeVerifyBloc, CodeVerifyState>(
                      listener: (context, state) {
                        if (state is CodeVerifySuccessState) {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LoginScreen()));
                        } else if (state is CodeVerifyFailedState) {
                          fToast.showToast(
                              child: ToastWidget(
                                  message: state.error, status: "error"));
                          context
                              .read<CodeVerifyBloc>()
                              .emit(CodeVerifyInitState());
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
                                  OTPFormWidget(
                                    onChanged: (value) => {
                                      timer?.cancel(),
                                      context.read<CodeVerifyBloc>().add(
                                          OnClickVerifyEvent(
                                              username: widget.username,
                                              code: value))
                                    },
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  if (Seconds > 0)
                                    Text(
                                      "G???i l???i m?? x??c th???c sau 00:${Seconds.toString().length == 1 ? ("0" + Seconds.toString()) : Seconds}",
                                      style:
                                          Theme.of(context).textTheme.bodyText1,
                                    )
                                  else
                                    TextButton(
                                        onPressed: () {
                                          setState(() {
                                            Seconds = 60;
                                          });
                                          context.read<CodeVerifyBloc>().add(
                                              OnResendCodeEvent(
                                                  username: widget.username));
                                        },
                                        child: const Text(
                                          "G???i l???i",
                                          style:
                                              TextStyle(color: Colors.orange),
                                        )),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      ElevatedButton.icon(
                                          style: ElevatedButton.styleFrom(
                                            elevation: 0,
                                            backgroundColor: Colors.white,
                                            disabledBackgroundColor:
                                                Colors.white,
                                          ),
                                          onPressed: (() {
                                            timer?.cancel();
                                            Navigator.pop(context);
                                          }),
                                          icon: Image.asset(
                                            "assets/icons/edit.png",
                                            width: 24,
                                            height: 24,
                                          ),
                                          label: Text("?????i s??? ??i???n tho???i",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyText1)),
                                      ElevatedButton.icon(
                                          style: ElevatedButton.styleFrom(
                                            elevation: 0,
                                            backgroundColor: Colors.white,
                                            disabledBackgroundColor:
                                                Colors.white,
                                          ),
                                          onPressed: null,
                                          icon: Image.asset(
                                            "assets/icons/phone.png",
                                            width: 24,
                                            height: 24,
                                          ),
                                          label: Text(
                                            "Hotline h??? tr???",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText1,
                                          ))
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ))))
            ],
          ),
        ),
      ),
    );
  }
}
