import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hufi_vnvc_application/blocs/cart_bloc/cart_bloc.dart';
import 'package:hufi_vnvc_application/blocs/cart_bloc/cart_state.dart';
import 'package:hufi_vnvc_application/blocs/home_bloc/home_bloc.dart';
import 'package:hufi_vnvc_application/blocs/home_bloc/home_event.dart';
import 'package:hufi_vnvc_application/blocs/home_bloc/home_state.dart';
import 'package:hufi_vnvc_application/blocs/vaccine_bloc/vaccine_event.dart';
import 'package:hufi_vnvc_application/blocs/vaccine_bloc/vaccine_state.dart';
import 'package:hufi_vnvc_application/blocs/vaccine_bloc/vacicne_bloc.dart';
import 'package:hufi_vnvc_application/models/vaccine_category_model.dart';
import 'package:hufi_vnvc_application/themes/color.dart';
import 'package:hufi_vnvc_application/utils/ToastWidget/toast_widget.dart';
import 'package:hufi_vnvc_application/widgets/carousel_cateogry_widget.dart';
import 'package:hufi_vnvc_application/widgets/carousel_image_widget.dart';
import 'package:hufi_vnvc_application/widgets/category_horization_widget.dart';
import 'package:hufi_vnvc_application/widgets/items/vaccine_item.dart';
import 'package:hufi_vnvc_application/widgets/layout/top_bar.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    FToast fToast = FToast();
    fToast.init(context);
    return Scaffold(
        appBar: const TopAppBar(),
        body: MultiBlocProvider(
            providers: [
              BlocProvider(
                  create: ((context) => HomeBloc()..add(OnLoadBannerEvent()))),
              BlocProvider(
                  create: (context) =>
                      VaccineBloc()..add(OnLoadCategoryEvent())),
              BlocProvider(create: (context) => CartBloc())
            ],
            child: MultiBlocListener(
                listeners: [
                  BlocListener<CartBloc, CartState>(
                      listener: ((context, state) {
                    if (state is AddToCartResult) {
                      if (state.isSuccess) {
                        fToast.showToast(
                            child: ToastWidget(
                                icon: const Icon(
                                  Icons.check_circle_outline,
                                  color: Colors.lightGreen,
                                ),
                                message: state.message,
                                status: "success"));
                      }
                    }
                  }))
                ],
                child: ListView(
                  shrinkWrap: true,
                  children: <Widget>[
                    BlocBuilder<HomeBloc, HomeState>(
                        builder: ((context, state) {
                      if (state is BannerLoadingState) {
                        return Center(
                          child: LoadingAnimationWidget.stretchedDots(
                              color: ColorTheme.secondary, size: 24),
                        );
                      } else if (state is BannerSuccessState) {
                        return CarouselWidget(
                          images: state.banners,
                        );
                      } else {
                        return const SizedBox(
                          height: 30,
                        );
                      }
                    })),
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Colors.blue.shade100,
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Image.network(
                              excludeFromSemantics: true,
                              width: 80,
                              scale: 5,
                              fit: BoxFit.cover,
                              "https://vnvc.vn/img/logo.png"),
                          Image.network(
                              width: 80,
                              fit: BoxFit.cover,
                              "https://vnvc.vn/img/logo.png"),
                          Image.network(
                              width: 80,
                              fit: BoxFit.cover,
                              "https://vnvc.vn/img/logo.png"),
                          Image.network(
                              width: 80,
                              fit: BoxFit.cover,
                              "https://vnvc.vn/img/logo.png"),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const CategoryCarouselWidget(),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 22),
                      child: BlocBuilder<VaccineBloc, VaccineState>(
                          builder: ((context, state) => Column(
                                children: [
                                  Container(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      "Danh mục vắc xin",
                                      style:
                                          Theme.of(context).textTheme.headline6,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  if (state.vaccineStatus ==
                                      VaccineStatus.VaccineLoading) ...[
                                    Center(
                                      heightFactor: 150,
                                      child:
                                          LoadingAnimationWidget.stretchedDots(
                                              color: ColorTheme.secondary,
                                              size: 24),
                                    ),
                                  ] else if (state.vaccineStatus ==
                                      VaccineStatus.VaccineSuccess) ...[
                                    CategoryHorizationWidget(
                                      items: state.categorySuccessState
                                              ?.categories ??
                                          const <VaccineCategoryModel>[],
                                      groupValue:
                                          state.categorySuccessState?.currentId,
                                      onTap: (value) => {
                                        context.read<VaccineBloc>().add(
                                            OnClickCategoryEvent(id: value))
                                      },
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    GridView(
                                      primary: false,
                                      shrinkWrap: true,
                                      gridDelegate:
                                          const SliverGridDelegateWithFixedCrossAxisCount(
                                              mainAxisExtent: 330,
                                              crossAxisCount: 2,
                                              crossAxisSpacing: 15),
                                      children: state
                                              .vaccineSuccessState?.vaccines
                                              .map((e) => VaccineItem(e))
                                              .toList() ??
                                          [],
                                    ),
                                  ] else
                                    const Center(
                                      child: Text("Không có vắc xin"),
                                    )
                                ],
                              ))),
                    )
                  ],
                ))));
  }
}
