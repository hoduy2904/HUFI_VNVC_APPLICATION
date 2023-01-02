import 'package:flutter/material.dart';

class FormControl extends StatelessWidget {
  final bool required;
  final String title;
  final Widget child;
  final TextAlign titleCenter;
  const FormControl(
      {Key? key,
      this.required = false,
      this.titleCenter = TextAlign.left,
      required this.title,
      required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              width: 2,
            ),
            required
                ? const Text(
                    "*",
                    style: TextStyle(color: Colors.red),
                  )
                : const Text("")
          ],
        ),
        const SizedBox(
          height: 3,
        ),
        child,
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
