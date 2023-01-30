import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hufi_vnvc_application/blocs/cart_bloc/cart_bloc.dart';
import 'package:hufi_vnvc_application/blocs/cart_bloc/cart_event.dart';
import 'package:hufi_vnvc_application/blocs/cart_bloc/cart_state.dart';
import 'package:hufi_vnvc_application/blocs/vaccine_bloc/vaccine_details_bloc/vaccine_details_bloc.dart';
import 'package:hufi_vnvc_application/themes/color.dart';
import 'package:hufi_vnvc_application/themes/typography.dart';
import 'package:hufi_vnvc_application/utils/ToastWidget/toast_widget.dart';
import 'package:intl/intl.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class VaccineDetailsScreen extends StatelessWidget {
  final int id;
  const VaccineDetailsScreen({required this.id, super.key});

  @override
  Widget build(BuildContext context) {
    FToast fToast = FToast();
    fToast.init(context);
    var width = MediaQuery.of(context).size.width;
    bool isMobile = width < 600;
    bool isDesktopSmall = width < 1200;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: ColorTheme.primary,
          title: Text(
            "Chi tiết vắc xin",
            style: TypographyTheme.titleBar,
          ),
          centerTitle: true,
        ),
        body: MultiBlocProvider(
          providers: [
            BlocProvider(
                create: (context) => VaccineDetailsBloc()
                  ..add(OnLoadVaccineDetailsEvent(id: id))),
            BlocProvider(create: (context) => CartBloc())
          ],
          child: MultiBlocListener(
            listeners: [
              BlocListener<CartBloc, CartState>(listener: ((context, state) {
                if (state is AddToCartResult) {
                  fToast.showToast(
                      child: ToastWidget(
                          message: state.message,
                          status: state.isSuccess ? "success" : "error"));
                }
              }))
            ],
            child: BlocBuilder<VaccineDetailsBloc, VaccineDetailsState>(
                builder: ((context, state) {
              if (state is VaccineDetailsLoadingState) {
                return Center(
                  child: LoadingAnimationWidget.staggeredDotsWave(
                      color: ColorTheme.primary, size: 24),
                );
              } else if (state is VaccineDetailsFailedState) {
                return Center(
                  child: Text(state.error),
                );
              } else if (state is VaccineDetailsSuccessState) {
                return SingleChildScrollView(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(20),
                      color: ColorTheme.primary.withOpacity(0.05),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: state.vaccine.images.isEmpty
                                ? Image.asset(
                                    "assets/image/vaccineDefault.jpg",
                                    fit: BoxFit.fitWidth,
                                    height: isMobile
                                        ? 200
                                        : isDesktopSmall
                                            ? 400
                                            : 600,
                                    width: double.infinity,
                                  )
                                : Image.network(
                                    state.vaccine.images,
                                    fit: BoxFit.fitWidth,
                                    height: isMobile
                                        ? 200
                                        : isDesktopSmall
                                            ? 400
                                            : 600,
                                    width: double.infinity,
                                  ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            state.vaccine.name.toUpperCase(),
                            style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: Colors.black),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const Text(
                            "Nguồn gốc: ",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Colors.black),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          RichText(
                              text: TextSpan(children: [
                            const TextSpan(
                                text: "Phòng bệnh: ",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 14)),
                            TextSpan(
                                text: state.vaccine.prevention,
                                style: const TextStyle(fontSize: 14))
                          ])),
                          const SizedBox(
                            height: 15,
                          ),
                          Text(
                            "${NumberFormat("#,##0").format(state.vaccine.price)}đ",
                            style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w800,
                                color: ColorTheme.primary),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          BlocBuilder<CartBloc, CartState>(
                              builder: ((context, state) => ElevatedButton(
                                    onPressed: () => context
                                        .read<CartBloc>()
                                        .add(OnAddCartEvent(idProduct: id)),
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: ColorTheme.primary,
                                        minimumSize: const Size.fromHeight(45)),
                                    child: const Text("Đăng ký mũi tiêm"),
                                  ))),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Mô tả thông tin vắc xin ${state.vaccine.name}",
                            style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Html(
                            data: "Mô tả",
                            onLinkTap: (url, context, attributes, element) =>
                                print(url),
                          )
                        ],
                      ),
                    ),
                  ],
                ));
              } else {
                return const Center(
                  child: Text("Vui lòng thử lại"),
                );
              }
            })),
          ),
        ));
  }
}
