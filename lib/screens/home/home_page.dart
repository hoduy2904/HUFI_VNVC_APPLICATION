import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/carousel_cateogry_widget.dart';
import 'package:flutter_application_1/widgets/carousel_image_widget.dart';
import 'package:flutter_application_1/widgets/list_vaccine_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        body: SafeArea(
          child: ListView(children: [
            //app bar
            Container(
              color: Colors.blue[900],
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(
                      Icons.notifications,
                      color: Colors.white,
                    ),
                    Row(
                      children: [
                        ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: (Image.network(
                              "https://th.bing.com/th/id/R.1cfd276cdb6101d005212f6b17d21e10?rik=r4U%2be5jZ9XsW9Q&pid=ImgRaw&r=0",
                              width: 35,
                              height: 35,
                            ))),
                        Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Column(
                            children: const [
                              Text(
                                "Chào buổi sáng",
                                style: TextStyle(
                                    fontSize: 12, color: Colors.white),
                              ),
                              Text(
                                "Hồ Đức Duy",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox()
                  ],
                ),
              ),
            ),
            const CarouselWidget(),
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
            VaccineListWidget()
          ]),
        ));
  }
}
