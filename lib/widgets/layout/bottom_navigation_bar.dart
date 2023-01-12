import 'package:flutter/material.dart';
import 'package:hufi_vnvc_application/themes/color.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  final List<BottomNavigationBarItem> items;
  final int currentIndex;
  final Function onChange;
  const BottomNavigationBarWidget(
      {required this.onChange,
      required this.items,
      this.currentIndex = 0,
      super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.white,
      unselectedItemColor: Colors.grey,
      selectedItemColor: ColorTheme.primary,
      items: items,
      currentIndex: currentIndex,
      showUnselectedLabels: true,
      type: BottomNavigationBarType.fixed,
      onTap: (index) {
        onChange(index);
      },
    );
  }
}
