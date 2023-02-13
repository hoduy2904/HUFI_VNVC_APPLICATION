import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hufi_vnvc_application/screens/order/order_complete.dart';
import 'package:hufi_vnvc_application/screens/order/payment_order.dart';
import 'package:hufi_vnvc_application/screens/order/people_order.dart';
import 'package:hufi_vnvc_application/themes/color.dart';
import 'package:hufi_vnvc_application/themes/typography.dart';
import 'package:hufi_vnvc_application/utils/ToastWidget/toast_widget.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen>
    with TickerProviderStateMixin {
  bool isChoosePeople = false;
  bool isPayment = false;
  int selectId = -1;
  int currentTab = 0;
  late FToast fToast;
  @override
  void initState() {
    super.initState();
    fToast = FToast();
    fToast.init(context);
  }

  @override
  Widget build(BuildContext context) {
    var tab = TabController(length: 3, vsync: this, initialIndex: currentTab);
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: ColorTheme.primary,
            title: Text(
              "Đặt trước",
              style: TypographyTheme.titleBar,
            ),
            centerTitle: true,
            bottom: TabBar(
                onTap: (value) {
                  setState(() {
                    tab.index = tab.previousIndex;
                  });
                },
                controller: tab,
                enableFeedback: false,
                labelStyle: const TextStyle(fontSize: 13),
                tabs: [
                  Tab(
                    height: 100,
                    text: "Thông tin\nngười tiêm",
                    icon: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: currentTab == 0
                                ? Colors.white
                                : ColorTheme.primaryStrong,
                            borderRadius: BorderRadius.circular(8)),
                        child: Icon(
                          isChoosePeople ? Icons.check : Icons.people_alt,
                          color: currentTab == 0
                              ? ColorTheme.primaryStrong
                              : isChoosePeople
                                  ? Colors.lightGreen
                                  : Colors.white,
                        )),
                  ),
                  Tab(
                    height: 100,
                    text: "Thanh toán",
                    icon: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: currentTab == 1
                                ? Colors.white
                                : ColorTheme.primaryStrong,
                            borderRadius: BorderRadius.circular(8)),
                        child: Icon(
                          isPayment ? Icons.check : Icons.payment,
                          color: currentTab == 1
                              ? isPayment
                                  ? Colors.lightGreen
                                  : ColorTheme.primaryStrong
                              : Colors.white,
                        )),
                  ),
                  Tab(
                    height: 100,
                    text: "Xác nhận\ntừ VNVC",
                    icon: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: currentTab == 2
                              ? Colors.white
                              : ColorTheme.primaryStrong,
                          borderRadius: BorderRadius.circular(8)),
                      child: Icon(
                        Icons.done,
                        color: currentTab == 2
                            ? ColorTheme.primaryStrong
                            : Colors.white,
                      ),
                    ),
                  )
                ]),
          ),
          body: TabBarView(
              physics: const NeverScrollableScrollPhysics(),
              controller: tab,
              children: [
                PeopleOrder(
                  onSelect: (id) => {
                    setState(() {
                      selectId = id;
                      currentTab = 1;
                      isChoosePeople = true;
                    }),
                  },
                ),
                SingleChildScrollView(
                    child: PaymentOrder(
                  selectId: selectId,
                  onPay: (isSuccess, message) {
                    if (isSuccess) {
                      setState((() {
                        currentTab = 2;
                        isPayment = true;
                      }));
                    } else {
                      fToast.showToast(
                          child:
                              ToastWidget(message: message, status: "error"));
                    }
                  },
                )),
                const OrderComplete()
              ]),
        ));
  }
}
