import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hufi_vnvc_application/blocs/home_bloc/home_bloc.dart';
import 'package:hufi_vnvc_application/blocs/home_bloc/home_event.dart';
import 'package:hufi_vnvc_application/blocs/home_bloc/home_state.dart';
import 'package:hufi_vnvc_application/models/vaccine_category_model.dart';
import 'package:hufi_vnvc_application/themes/color.dart';
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
    return Scaffold(
        appBar: const TopAppBar(),
        body: BlocProvider(
            create: (context) => HomeBloc()
              ..add(OnLoadBannerEvent())
              ..add(OnLoadCategoryEvent()),
            child: BlocBuilder<HomeBloc, HomeState>(
                builder: ((context, state) => ListView(
                      shrinkWrap: true,
                      children: <Widget>[
                        if (state is BannerLoadingState)
                          Center(
                            child: LoadingAnimationWidget.stretchedDots(
                                color: ColorTheme.secondary, size: 24),
                          ),
                        if (state is BannerSuccessState)
                          CarouselWidget(
                            images: state.bannerSuccessState?.banners ?? [],
                          ),
                        const SizedBox(
                          height: 30,
                        ),
                        const CategoryCarouselWidget(),
                        const SizedBox(
                          height: 10,
                        ),
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
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 22),
                          child: Column(
                            children: [
                              Container(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "Danh mục vắc xin",
                                  style: Theme.of(context).textTheme.headline6,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              if (state is CategoryLoaddingState)
                                Center(
                                  child: LoadingAnimationWidget.stretchedDots(
                                      color: ColorTheme.secondary, size: 24),
                                ),
                              if (state is CategorySuccessState)
                                CategoryHorizationWidget(
                                  items:
                                      state.categorySuccessState?.categories ??
                                          const <VaccineCategoryModel>[],
                                  groupValue:
                                      state.categorySuccessState?.currentId,
                                  onTap: (value) => {
                                    context
                                        .read<HomeBloc>()
                                        .add(OnClickCategoryEvent(id: value))
                                  },
                                ),
                              const SizedBox(
                                height: 10,
                              ),
                              if (state is ProductLoadingState)
                                Center(
                                  child: LoadingAnimationWidget.stretchedDots(
                                      color: ColorTheme.secondary, size: 24),
                                ),
                              if (state is ProductSuccessState)
                                GridView(
                                  primary: false,
                                  shrinkWrap: true,
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                          mainAxisExtent: 325,
                                          crossAxisCount: 2,
                                          crossAxisSpacing: 15),
                                  children: state.productSuccessState?.vaccines
                                          .map((e) => VaccineItem(e))
                                          .toList() ??
                                      [],
                                )
                              else
                                const Center(
                                  child: Text("Không có vắc xin"),
                                )
                            ],
                          ),
                        )
                      ],
                    )))));
  }
}
