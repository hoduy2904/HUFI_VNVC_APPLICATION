import 'package:flutter/material.dart';
import 'package:hufi_vnvc_application/themes/color.dart';
import 'package:hufi_vnvc_application/themes/typography.dart';
import 'package:hufi_vnvc_application/utils/SearchBarWidget/search_bar.dart';

class FormWithSearchWidget extends StatelessWidget {
  final Widget child;
  final Function searchChange;
  final String titleBar;
  final bool isShowAppBar;
  final String hint;
  const FormWithSearchWidget(
      {this.isShowAppBar = true,
      this.hint = '',
      required this.titleBar,
      required this.searchChange,
      required this.child,
      super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
          appBar: isShowAppBar
              ? AppBar(
                  elevation: 0,
                  backgroundColor: ColorTheme.primary,
                  title: Text(
                    titleBar,
                    style: TypographyTheme.titleBar,
                  ),
                  centerTitle: true,
                )
              : null,
          body: Center(
              child: Column(
            children: [
              Container(
                color: Colors.blue.shade800,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SearchBarWidget(
                    hint: hint, onChange: (value) => searchChange(value)),
              ),
              const SizedBox(
                height: 10,
              ),
              child
            ],
          )),
        ));
  }
}
