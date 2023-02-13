import 'package:flutter/material.dart';
import 'package:hufi_vnvc_application/themes/color.dart';
import 'package:hufi_vnvc_application/utils/Debouncer/debouncer.dart';

class SearchBarWidget extends StatelessWidget {
  final Function onChange;
  final String hint;
  const SearchBarWidget({required this.onChange, this.hint = '', super.key});

  @override
  Widget build(BuildContext context) {
    var debounce = Debouncer(milliseconds: 1500);
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: ColorTheme.primaryStrong,
      ),
      child: TextField(
          decoration: InputDecoration(
              border: InputBorder.none,
              isDense: true,
              hintText: hint,
              hintStyle: const TextStyle(fontSize: 13, color: Colors.white),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
              prefixIcon: const Icon(
                Icons.search,
                color: Colors.white,
              )),
          style: const TextStyle(fontSize: 13, color: Colors.white),
          onChanged: (value) {
            debounce.run(() => onChange(value));
          }),
    );
  }
}
