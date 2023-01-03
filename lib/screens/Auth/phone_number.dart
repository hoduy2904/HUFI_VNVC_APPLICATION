import 'dart:async';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:hufi_vnvc_application/screens/Auth/code_verify.dart';

class PhoneNumberView extends StatefulWidget {
  const PhoneNumberView({super.key});
  static const String route = "/auth/verifyPhone";

  @override
  State<PhoneNumberView> createState() => _PhoneNumberViewState();
}

class _PhoneNumberViewState extends State<PhoneNumberView> {
  String phoneNumber = "";

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
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30),
                child: Column(
                  children: [
                    TextField(
                      style: TextStyle(fontSize: 14),
                      onChanged: (phone) => {
                        setState(() {
                          phoneNumber = phone;
                        }),
                      },
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                          isDense: true,
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 10),
                          labelText: "Nhập số điện thoại của bạn",
                          labelStyle: const TextStyle(fontSize: 12),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8))),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    ElevatedButton(
                        onPressed: phoneNumber.isEmpty
                            ? null
                            : (() {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const VerifyCodeScreen()));
                              }),
                        style: ElevatedButton.styleFrom(
                            disabledForegroundColor: Colors.white,
                            disabledBackgroundColor:
                                const Color.fromARGB(255, 127, 151, 213),
                            backgroundColor: Colors.blue.shade800,
                            minimumSize: Size.fromHeight(40)),
                        child: const Text("Tiếp tục"))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
