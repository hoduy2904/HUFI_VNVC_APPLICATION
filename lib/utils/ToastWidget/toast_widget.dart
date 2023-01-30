import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hufi_vnvc_application/themes/color.dart';

class ToastWidget extends StatelessWidget {
  final String message;
  final String status;
  final Widget? icon;
  const ToastWidget(
      {required this.message, required this.status, this.icon, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          color: status == "success"
              ? ColorTheme.primary
              : status == "error"
                  ? Colors.red.withOpacity(0.8)
                  : ColorTheme.primary,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            icon ?? const SizedBox(),
            SizedBox(
              width: icon == null ? 0 : 12.0,
            ),
            Text(
              message,
              style: const TextStyle(color: Colors.white),
            ),
          ],
        ));
  }
}
