import 'package:flutter/material.dart';
import 'package:hufi_vnvc_application/screens/order/order_complete.dart';
import 'package:hufi_vnvc_application/screens/order/payment_order.dart';
import 'package:hufi_vnvc_application/screens/order/people_order.dart';

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
  @override
  Widget build(BuildContext context) {
    var tab = TabController(length: 3, vsync: this, initialIndex: currentTab);
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blue.shade800,
            title: const Text("Đặt trước"),
            centerTitle: true,
            bottom: TabBar(
                onTap: (value) {
                  tab.index = tab.previousIndex;
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
                                : Colors.blue.shade900,
                            borderRadius: BorderRadius.circular(8)),
                        child: Icon(
                          isChoosePeople ? Icons.check : Icons.people_alt,
                          color: currentTab == 0
                              ? Colors.blue.shade900
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
                                : Colors.blue.shade900,
                            borderRadius: BorderRadius.circular(8)),
                        child: Icon(
                          isPayment ? Icons.check : Icons.payment,
                          color: currentTab == 1
                              ? isPayment
                                  ? Colors.lightGreen
                                  : Colors.blue.shade900
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
                              : Colors.blue.shade900,
                          borderRadius: BorderRadius.circular(8)),
                      child: Icon(
                        Icons.done,
                        color: currentTab == 2
                            ? Colors.blue.shade900
                            : Colors.white,
                      ),
                    ),
                  )
                ]),
          ),
          body: TabBarView(controller: tab, children: [
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
              onPay: () => {
                setState((() {
                  currentTab = 2;
                  isPayment = true;
                }))
              },
            )),
            const OrderComplete()
          ]),
        ));
  }
}