import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/Auth/code_verify.dart';
import 'package:flutter_application_1/screens/Auth/create_password.dart';
import 'package:flutter_application_1/screens/Auth/phone_number.dart';
import 'package:flutter_application_1/screens/history_injection/history_injection.dart';
import 'package:flutter_application_1/screens/home/home_page.dart';
import 'package:flutter_application_1/screens/profile/profile_infomation.dart';
import 'package:flutter_application_1/screens/vaccine/vaccines.dart';
import 'package:flutter_application_1/widgets/history_injection_item.dart';
import 'package:flutter_application_1/widgets/layout/bottom_navigation_bar.dart';
import 'package:flutter_application_1/widgets/layout/top_bar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return MaterialApp(
      routes: {VerifyCodeScreen.route: (context) => const VerifyCodeScreen()},
      home: true
          ? VaccinesScreen()
          : Scaffold(
              appBar: TopAppBar(),
              body: Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  Expanded(
                    flex: 100,
                    child: Image.network(
                        fit: BoxFit.contain,
                        "https://cdn.pixabay.com/photo/2015/12/16/17/17/christmas-1096220_1280.png"),
                  ),
                  Expanded(
                      flex: 30,
                      child: Image.network(
                          fit: BoxFit.contain,
                          "https://cdn-icons-png.flaticon.com/512/6239/6239677.png"))
                ],
              )),
              bottomNavigationBar: BottomNavigationBarview(),
              floatingActionButton: FloatingActionButton(
                onPressed: () {},
                child: IconButton(
                  icon: Icon(Icons.plus_one),
                  color: Colors.white,
                  onPressed: () {
                    setState(() {
                      counter += 1;
                    });
                  },
                ),
              ),
            ),
    );
  }
}
