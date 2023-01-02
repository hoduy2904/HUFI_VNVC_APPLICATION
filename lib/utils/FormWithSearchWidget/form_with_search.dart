import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/SearchBarWidget/search_bar.dart';

class FormWithSearchWidget extends StatelessWidget {
  final Widget child;
  final Function searchChange;
  final String titleBar;
  final bool isShowAppBar;
  const FormWithSearchWidget(
      {this.isShowAppBar = true,
      required this.titleBar,
      required this.searchChange,
      required this.child,
      super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: isShowAppBar
          ? AppBar(
              elevation: 0,
              backgroundColor: Colors.blue.shade800,
              title: Text(
                titleBar,
                style: const TextStyle(fontSize: 16),
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
            child: SearchBarWidget(onChange: (value) => searchChange(value)),
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
