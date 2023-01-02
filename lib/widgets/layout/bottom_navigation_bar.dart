import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';

class BottomNavigationBarview extends StatefulWidget {
  const BottomNavigationBarview({super.key});

  @override
  State<BottomNavigationBarview> createState() =>
      _BottomNavigationBarviewState();
}

class _BottomNavigationBarviewState extends State<BottomNavigationBarview> {
  int _currentIndex = 1;
  @override
  Widget build(BuildContext context) {
    List<BottomNavigationBarItem> items = [
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
    return BottomNavigationBar(
      backgroundColor: Colors.white,
      unselectedItemColor: Colors.grey,
      selectedItemColor: Colors.blue[800],
      items: items,
      currentIndex: _currentIndex,
      showUnselectedLabels: true,
      type: BottomNavigationBarType.fixed,
      onTap: (index) {
        setState(() {
          _currentIndex = index;
        });
      },
    );
  }
}
