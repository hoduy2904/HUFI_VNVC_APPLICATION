import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/FormWithSearchWidget/form_with_search.dart';
import 'package:flutter_application_1/widgets/layout/top_bar.dart';
import 'package:flutter_application_1/widgets/list_vaccine_widget.dart';

class VaccinesScreen extends StatelessWidget {
  const VaccinesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FormWithSearchWidget(
      titleBar: "Danh mục vắc xin",
      searchChange: () => {},
      child: Expanded(child: VaccineListWidget()),
    );
  }
}
