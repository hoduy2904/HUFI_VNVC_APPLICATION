import 'dart:io';

import 'package:animations/animations.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hufi_vnvc_application/blocs/auth_bloc/auth_bloc.dart';
import 'package:hufi_vnvc_application/blocs/auth_bloc/auth_event.dart';
import 'package:hufi_vnvc_application/blocs/auth_bloc/auth_state.dart';
import 'package:hufi_vnvc_application/blocs/cart_bloc/cart_bloc.dart';
import 'package:hufi_vnvc_application/screens/Auth/login.dart';
import 'package:hufi_vnvc_application/screens/home/home_page.dart';
import 'package:hufi_vnvc_application/screens/profile/personal_screen.dart';
import 'package:hufi_vnvc_application/screens/record/record.dart';
import 'package:hufi_vnvc_application/screens/splash_screen/splash_screen.dart';
import 'package:hufi_vnvc_application/screens/vaccine/vaccines.dart';
import 'package:hufi_vnvc_application/widgets/layout/bottom_navigation_bar.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const RunFirstApp());
}

class RunFirstApp extends StatelessWidget {
  const RunFirstApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<AuthBloc>(
            create: (context) => AuthBloc()..add(OnCheckLoginEvent()),
          ),
          BlocProvider<CartBloc>(create: (context) => CartBloc())
        ],
        child: MaterialApp(
            home: BlocBuilder<AuthBloc, AuthState>(builder: ((context, state) {
          if (state is AuthLoading) {
            return const SplashScreen();
          } else if (state is AuthenticationState) {
            return MyApp();
          } else if (state is UnAuthenticationState) {
            return const LoginScreen();
          } else {
            return const SplashScreen();
          }
        }))));
  }
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
    isShowAppBar: true,
  ),
  RecordScreen(),
  PersonalScreen()
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
    label: "Lịch tiêm",
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.contacts_outlined),
    label: "Cá nhân",
  )
];
