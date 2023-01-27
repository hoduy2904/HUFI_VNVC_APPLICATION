import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hufi_vnvc_application/blocs/order_bloc/people_order_bloc/people_order_bloc.dart';
import 'package:hufi_vnvc_application/blocs/order_bloc/people_order_bloc/people_order_event.dart';
import 'package:hufi_vnvc_application/blocs/order_bloc/people_order_bloc/people_order_state.dart';
import 'package:hufi_vnvc_application/themes/color.dart';
import 'package:hufi_vnvc_application/widgets/items/people_viewer_item.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class PeopleOrder extends StatelessWidget {
  final Function onSelect;
  const PeopleOrder({required this.onSelect, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Scaffold(
          body: SingleChildScrollView(
            child: BlocProvider(
              create: (context) =>
                  PeopleOrderBloc()..add(OnLoadPeopleOrderEvent()),
              child: Column(children: [
                TextField(
                  style: const TextStyle(fontSize: 12),
                  onChanged: (value) => context
                      .read<PeopleOrderBloc>()
                      .add(OnSearchPeopleOrderEvent(query: value)),
                  decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.search,
                        color: ColorTheme.primary,
                      ),
                      hintStyle: const TextStyle(fontSize: 12),
                      hintText: "Tìm kiếm theo tên",
                      isDense: true,
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 12),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: ColorTheme.primary),
                          borderRadius: BorderRadius.circular(5))),
                ),
                const SizedBox(
                  height: 30,
                ),
                BlocBuilder<PeopleOrderBloc, PeopleOrderState>(
                    builder: ((context, state) {
                  if (state is PeopleOrderLoadingState) {
                    return Center(
                      child: LoadingAnimationWidget.fourRotatingDots(
                          color: ColorTheme.primary, size: 24),
                    );
                  } else if (state is PeopleOrderSuccessState) {
                    return Column(children: [
                      PeopleItem(
                          peopleItemModel: state.people,
                          onTab: (id) => {onSelect(id)}),
                      ...state.people.customerLink.map((e) => PeopleItem(
                          peopleItemModel: e, onTab: (id) => {onSelect(id)}))
                    ]);
                  } else if (state is PeopleOrderFailedState) {
                    return Center(
                      child: Text(
                        state.error,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    );
                  } else {
                    return Center(
                      child: Text(
                        "Vui lòng thử lại",
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    );
                  }
                }))
              ]),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: (() {}),
            backgroundColor: ColorTheme.primary,
            child: const Icon(
              Icons.plus_one,
              color: Colors.white,
            ),
          )),
    );
  }
}
