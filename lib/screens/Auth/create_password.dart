import 'package:flutter/material.dart';
import 'package:hufi_vnvc_application/screens/Auth/phone_number.dart';
import 'package:hufi_vnvc_application/screens/profile/profile_infomation.dart';

class CreatePasswordScreen extends StatefulWidget {
  const CreatePasswordScreen({super.key});

  @override
  State<CreatePasswordScreen> createState() => _CreatePasswordScreenState();
}

class _CreatePasswordScreenState extends State<CreatePasswordScreen> {
  String password = "";
  String repeatPassword = "";
  final textFieldFocusNode = FocusNode();
  bool _obscured = false;

  void _toggleObscured() {
    setState(() {
      _obscured = !_obscured;
      if (textFieldFocusNode.hasPrimaryFocus)
        return; // If focus is on text field, dont unfocus
      textFieldFocusNode.canRequestFocus =
          false; // Prevents focus if tap on eye
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color.fromARGB(255, 9, 39, 208), Colors.blue.shade300])),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            SizedBox(
              height: 60,
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(width: 5, color: Colors.blue.shade200),
                  borderRadius: BorderRadius.circular(100)),
              child: Image.asset(
                "assets/icons/compliant.png",
                scale: 8,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "Đặt mật khẩu",
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
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                textAlign: TextAlign.center,
                "Nhập mật khẩu 6 ký tự số dùng để xác thực tài khoản VNVC cho các lần đăng nhập sau",
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
                          obscureText: !_obscured,
                          style: TextStyle(fontSize: 14),
                          onChanged: (pwd) => {
                            setState(() {
                              password = pwd;
                            }),
                          },
                          keyboardType: TextInputType.visiblePassword,
                          validator: (val) => val!.length < 6
                              ? 'Mật khẩu phải có 6 ký tự'
                              : null,
                          decoration: InputDecoration(
                              suffixIcon: GestureDetector(
                                onTap: _toggleObscured,
                                child: Icon(_obscured
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
                          obscureText: !_obscured,
                          style: TextStyle(fontSize: 14),
                          onChanged: (pwd) => {
                            setState(() {
                              repeatPassword = pwd;
                            }),
                          },
                          keyboardType: TextInputType.visiblePassword,
                          validator: (val) =>
                              val == password ? "Không giống mật khẩu" : null,
                          decoration: InputDecoration(
                              suffixIcon: GestureDetector(
                                onTap: _toggleObscured,
                                child: Icon(_obscured
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
                            onPressed:
                                (password.isEmpty || repeatPassword.isEmpty)
                                    ? null
                                    : (() => {
                                          Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const ProfileInfomationScreen()))
                                        }),
                            style: ElevatedButton.styleFrom(
                                disabledForegroundColor: Colors.white,
                                disabledBackgroundColor:
                                    const Color.fromARGB(255, 127, 151, 213),
                                backgroundColor: Colors.blue.shade800,
                                minimumSize: const Size.fromHeight(40)),
                            child: const Text("Tiếp tục")),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            ElevatedButton.icon(
                                style: ElevatedButton.styleFrom(
                                  elevation: 0,
                                  backgroundColor: Colors.white,
                                  disabledBackgroundColor: Colors.white,
                                ),
                                onPressed: (() {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const PhoneNumberView()));
                                }),
                                icon: Image.asset(
                                  "assets/icons/edit.png",
                                  width: 24,
                                  height: 24,
                                ),
                                label: Text("Đổi số điện thoại",
                                    style:
                                        Theme.of(context).textTheme.bodyText1)),
                            ElevatedButton.icon(
                                style: ElevatedButton.styleFrom(
                                  elevation: 0,
                                  backgroundColor: Colors.white,
                                  disabledBackgroundColor: Colors.white,
                                ),
                                onPressed: null,
                                icon: Image.asset(
                                  "assets/icons/phone.png",
                                  width: 24,
                                  height: 24,
                                ),
                                label: Text(
                                  "Hotline hỗ trợ",
                                  style: Theme.of(context).textTheme.bodyText1,
                                ))
                          ],
                        )
                      ],
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
