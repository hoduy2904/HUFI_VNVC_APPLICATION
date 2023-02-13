import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  @override
  Widget build(BuildContext context) {
    ImageProvider imageProvider = const AssetImage("assets/image/logo.png");
    Image logo = Image(
      image: imageProvider,
      width: 100,
    );

    return Container(
        color: const Color.fromARGB(255, 40, 56, 144),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(),
            SizedBox(
              child: Column(
                children: [
                  logo,
                  Directionality(
                      textDirection: TextDirection.ltr,
                      child: LoadingAnimationWidget.fourRotatingDots(
                          color: const Color.fromARGB(255, 252, 192, 42),
                          size: 24)),
                ],
              ),
            ),
            Directionality(
              textDirection: TextDirection.ltr,
              child: Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  child: Text(
                    "© VNVC ${DateTime.now().year}",
                    style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        decoration: TextDecoration.none),
                  )),
            )
          ],
        ));
  }
}
