import 'package:flutter/material.dart';

class OrderComplete extends StatelessWidget {
  const OrderComplete({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Center(
        child: Column(
          children: [
            Icon(
              Icons.check_circle,
              color: Colors.green,
              size: 50,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Đặt hàng thành công",
              style: Theme.of(context).textTheme.headline6,
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              "Cám ơn bạn đã sử dụng dịch vụ của VNVC",
              style: Theme.of(context).textTheme.bodyText1,
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () =>
                    {Navigator.popUntil(context, (route) => route.isFirst)},
                child: Text("Quay lại trang chủ"))
          ],
        ),
      )
    ]);
  }
}
