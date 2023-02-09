import 'dart:io';

import 'package:animations/animations.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hufi_vnvc_application/blocs/auth_bloc/auth_bloc.dart';
import 'package:hufi_vnvc_application/blocs/auth_bloc/auth_event.dart';
import 'package:hufi_vnvc_application/blocs/auth_bloc/auth_state.dart';
import 'package:hufi_vnvc_application/blocs/cart_bloc/cart_bloc.dart';
import 'package:hufi_vnvc_application/blocs/chat_bloc/chat_bloc.dart';
import 'package:hufi_vnvc_application/firebase_options.dart';
import 'package:hufi_vnvc_application/screens/Auth/login.dart';
import 'package:hufi_vnvc_application/screens/chat/chat.dart';
import 'package:hufi_vnvc_application/screens/home/home_page.dart';
import 'package:hufi_vnvc_application/screens/profile/personal_screen.dart';
import 'package:hufi_vnvc_application/screens/record/record.dart';
import 'package:hufi_vnvc_application/screens/splash_screen/splash_screen.dart';
import 'package:hufi_vnvc_application/screens/vaccine/vaccines.dart';
import 'package:hufi_vnvc_application/services/api_services.dart';
import 'package:hufi_vnvc_application/services/notification_services.dart';
import 'package:hufi_vnvc_application/widgets/layout/bottom_navigation_bar.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.

  await NotificationServices().showNotification(
      title: message.notification?.title ?? "Thông báo",
      body: message.notification?.body ?? "");
  print("Handling a background message: ${message.messageId}");
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const RunFirstApp());
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

Future<void> loadFirebase({int? loginId}) async {
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  await NotificationServices().initNotification();
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  NotificationSettings settings = await messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );

  print('User granted permission: ${settings.authorizationStatus}');

  //Firebase messaging
  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );

  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    RemoteNotification? notification = message.notification;
    AndroidNotification? android = message.notification?.android;

    // If `onMessage` is triggered with a notification, construct our own
    // local notification to show to users using the created channel.
    if (notification != null && android != null) {
      NotificationServices().showNotification(
          title: notification.title!, body: notification.body!);
    }
  });
  await messaging.subscribeToTopic("all");
  if (loginId != null) {
    await messaging.subscribeToTopic("device-$loginId");
  }
}

class RunFirstApp extends StatelessWidget {
  const RunFirstApp({super.key});
  @override
  Widget build(BuildContext context) {
    RequestAPI.instance;

    return MultiBlocProvider(
        providers: [
          BlocProvider<AuthBloc>(
            create: (context) => AuthBloc()..add(OnCheckLoginEvent()),
          ),
          BlocProvider<CartBloc>(create: (context) => CartBloc()),
          BlocProvider(create: ((context) => ChatBloc()))
        ],
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(fontFamily: 'Roboto'),
            home: BlocBuilder<AuthBloc, AuthState>(builder: ((context, state) {
              if (state is AuthLoading) {
                return const SplashScreen();
              } else if (state is AuthenticationState) {
                loadFirebase(loginId: state.loginId);
                return const MyApp();
              } else if (state is UnAuthenticationState) {
                return const LoginScreen();
              } else {
                return const SplashScreen();
              }
            }))));
  }
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

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
  VaccinesScreen(),
  RecordScreen(),
  ChatScreen(),
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
    icon: Icon(Icons.message_outlined),
    label: "Trò chuyện",
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.contacts_outlined),
    label: "Cá nhân",
  )
];
