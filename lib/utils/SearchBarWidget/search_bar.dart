import 'dart:ui';

import 'package:flutter/material.dart';

class SearchBarWidget extends StatelessWidget {
  final Function onChange;
  const SearchBarWidget({required this.onChange, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: Colors.blue.shade900,
      ),
      child: TextField(
        decoration: const InputDecoration(
            border: InputBorder.none,
            isDense: true,
            hintText: "Tìm theo tên gói, tên vắc xin",
            hintStyle: TextStyle(fontSize: 13, color: Colors.white),
            contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
            prefixIcon: Icon(
              Icons.search,
              color: Colors.white,
            )),
        style: const TextStyle(fontSize: 13, color: Colors.white),
        onChanged: (value) => onChange(value),
      ),
    );
  }
}
