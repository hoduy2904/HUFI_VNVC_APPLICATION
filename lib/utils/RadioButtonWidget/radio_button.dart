import 'package:flutter/material.dart';
import 'package:hufi_vnvc_application/themes/color.dart';

class RadioButtom<T> extends StatelessWidget {
  final T value;
  final T groupValue;
  final Function onChange;
  final String text;
  final EdgeInsetsGeometry? padding;
  final BorderRadius? borderRadius;
  final bool isBorder;
  final double? fontSize;
  final EdgeInsetsGeometry? margin;
  const RadioButtom(
      {required this.value,
      required this.groupValue,
      required this.onChange,
      required this.text,
      this.margin,
      this.fontSize,
      this.isBorder = false,
      this.borderRadius,
      this.padding,
      super.key});

  @override
  Widget build(BuildContext context) {
    bool isSelect = value == groupValue;
    return InkWell(
      hoverColor: Colors.transparent,
      onTap: () => onChange(value),
      child: Container(
        margin: margin,
        padding: padding,
        decoration: BoxDecoration(
            border: isBorder ? Border.all(color: ColorTheme.primary) : null,
            borderRadius: borderRadius,
            color: isSelect ? Colors.blue.shade800 : Colors.white),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: fontSize,
              color: isSelect ? Colors.white : ColorTheme.primary),
        ),
      ),
    );
  }
}
