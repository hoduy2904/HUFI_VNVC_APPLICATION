import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hufi_vnvc_application/themes/color.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CarouselWidget extends StatefulWidget {
  final List<String> images;
  const CarouselWidget({required this.images, super.key});

  @override
  State<CarouselWidget> createState() => _CarouselWidgetState();
}

class _CarouselWidgetState extends State<CarouselWidget> {
  int activeIndex = 0;
  @override
  Widget build(BuildContext context) {
    final List<Widget> imageSlider = widget.images
        .map((item) => Center(
                child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(item),
            )))
        .toList();
    return Container(
        alignment: Alignment.topCenter,
        child: Column(children: [
          Stack(
            children: [
              Positioned(
                  child: Container(
                height: 130,
                color: ColorTheme.primary,
              )),
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
              Positioned.fill(
                  bottom: 28,
                  child: Align(
                      alignment: Alignment.bottomCenter,
                      child: AnimatedSmoothIndicator(
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
                            height: 2,
                            color: Colors.blue.shade700,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          dotDecoration: DotDecoration(
                            width: 15,
                            height: 2,
                            color: const Color.fromARGB(255, 206, 206, 206),
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      )))
            ],
          ),
        ]));
  }
}
