import 'package:flutter/material.dart';

class ButtonSelectWidget extends StatelessWidget {
  final bool isBorderButton;
  final BorderSide? borderButton;
  final EdgeInsets? padding;
  final Function onTab;
  final Widget? leading;
  final Widget child;
  final Widget? lastRow;
  const ButtonSelectWidget(
      {this.isBorderButton = true,
      this.borderButton,
      this.lastRow,
      this.padding,
      this.leading,
      required this.child,
      required this.onTab,
      super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTab(),
      hoverColor: Colors.grey.withOpacity(0.2),
      child: Container(
        decoration: BoxDecoration(
            border: isBorderButton
                ? Border(
                    bottom: borderButton ??
                        BorderSide(width: 0.5, color: Colors.grey.shade300))
                : null),
        padding: padding ?? const EdgeInsets.all(11),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                leading ?? const SizedBox(),
                leading == null
                    ? const SizedBox()
                    : const SizedBox(
                        width: 15,
                      ),
                child
              ],
            ),
            lastRow ?? const SizedBox()
          ],
        ),
      ),
    );
  }
}
