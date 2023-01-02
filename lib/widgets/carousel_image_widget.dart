import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CarouselWidget extends StatefulWidget {
  const CarouselWidget({super.key});

  @override
  State<CarouselWidget> createState() => _CarouselWidgetState();
}

final List<String> imgList = [
  'https://vnvc.vn/wp-content/uploads/2022/12/tiem-goi-vacxin-theo-yeu-cau-mb.jpg',
  'https://vnvc.vn/wp-content/uploads/2021/12/uu-dai-giang-sinh-nam-moi-768x402.jpg',
  'https://vnvc.vn/wp-content/uploads/2022/12/vnvc-nga-bay-hau-giang-dat-giu-vac-xin-768x402.jpg',
];

class _CarouselWidgetState extends State<CarouselWidget> {
  int activeIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.topCenter,
        margin: EdgeInsets.only(top: 10),
        child: Column(children: [
          CarouselSlider(
            items: imageSlider,
            options: CarouselOptions(
              autoPlay: true,
              aspectRatio: 16 / 9,
              enlargeCenterPage: true,
              viewportFraction: 0.9,
              enlargeFactor: 0.4,
              onPageChanged: (index, reason) => {
                setState((() => {activeIndex = index}))
              },
            ),
          ),
          SizedBox(
            height: 10,
          ),
          AnimatedSmoothIndicator(
            count: imageSlider.length,
            activeIndex: activeIndex,
            onDotClicked: (index) {
              setState(() {
                activeIndex = index;
              });
            },
            effect: CustomizableEffect(
              activeDotDecoration: DotDecoration(
                width: 15,
                height: 6,
                color: Colors.black,
                borderRadius: BorderRadius.circular(20),
              ),
              dotDecoration: DotDecoration(
                width: 15,
                height: 6,
                color: Color.fromARGB(255, 94, 94, 94),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          )
        ]));
  }

  final List<Widget> imageSlider = imgList
      .map((item) => Container(
            child: Center(
                child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(item),
            )),
          ))
      .toList();
}
