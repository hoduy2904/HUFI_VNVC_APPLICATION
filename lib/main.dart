import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:hufi_vnvc_application/screens/Auth/phone_number.dart';
import 'package:hufi_vnvc_application/screens/history_injection/history_injection.dart';
import 'package:hufi_vnvc_application/screens/home/home_page.dart';
import 'package:hufi_vnvc_application/screens/vaccine/vaccines.dart';
import 'package:hufi_vnvc_application/widgets/layout/bottom_navigation_bar.dart';
import 'package:hufi_vnvc_application/widgets/layout/top_bar.dart';

void main() {
  runApp(MaterialApp(
    home: PhoneNumberView(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int counter = 0;
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Scaffold(
      appBar: const TopAppBar(),
      body: PageTransitionSwitcher(
        transitionBuilder: (child, primaryAnimation, secondaryAnimation) =>
            SharedAxisTransition(
          animation: primaryAnimation,
          secondaryAnimation: secondaryAnimation,
          transitionType: SharedAxisTransitionType.horizontal,
          child: child,
        ),
        child: Tabs[currentIndex],
      ),
      bottomNavigationBar: BottomNavigationBarWidget(
        items: items,
        currentIndex: currentIndex,
        onChange: (value) => {
          setState(
            () {
              currentIndex = value;
            },
          )
        },
      ),
    );
  }
}

const Tabs = [
  HomePage(),
  VaccinesScreen(
    isShowAppBar: false,
  ),
  HistoryInjectionScreen(
    isShowAppBar: false,
  ),
];

const items = [
  BottomNavigationBarItem(
    icon: Icon(Icons.home_outlined),
    label: "Trang chủ",
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.vaccines_outlined),
    label: "Vắc xin",
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.schedule_outlined),
    label: "Lịch sử tiêm",
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.contacts_outlined),
    label: "Cá nhân",
  )
];
