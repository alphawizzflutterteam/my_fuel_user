import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/home_controller.dart';

class SliderHome extends StatefulWidget {
  const SliderHome({Key? key}) : super(key: key);

  @override
  State<SliderHome> createState() => _SliderHomeState();
}

class _SliderHomeState extends State<SliderHome> {
  final List<Map<String, String>> imageList = [
    {"id": "1", "image_path": 'assets/dummy2.png'},
    {"id": "2", "image_path": 'assets/tyre.png'},
    {"id": "3", "image_path": 'assets/fuel.png'},
  ];

  int currentIndex = 0;
  final CarouselController _carouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: GetBuilder<HomeController>(
          init: HomeController(),
          builder: (controller) {
            return controller.list.length > 0
                ?

                /// When Data is Showing
                Column(
                    children: [
                      CarouselSlider(
                        items: controller.list.map((item) {
                          return Builder(
                            builder: (BuildContext context) {
                              return Stack(
                                fit: StackFit.expand,
                                children: [
                                  Column(
                                    children: [
                                      Image.network(
                                        "${item.imagePath!}/${item.photo!}",
                                        fit: BoxFit.cover,
                                        width: double.infinity,
                                      ),
                                    ],
                                  ),
                                ],
                              );
                            },
                          );
                        }).toList(),
                        carouselController: _carouselController,
                        options: CarouselOptions(
                          scrollPhysics: BouncingScrollPhysics(),
                          autoPlay: true,
                          aspectRatio: 2.0,
                          viewportFraction: 1.0,
                          onPageChanged: (index, reason) {
                            setState(() {
                              currentIndex = index;
                            });
                          },
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 0.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children:
                                controller.list.asMap().entries.map((entry) {
                              return GestureDetector(
                                onTap: () => _carouselController
                                    .animateToPage(entry.key),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 2.0),
                                  child: Container(
                                    width: currentIndex == entry.key ? 17 : 7,
                                    height: 10.0,
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 2.0),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: currentIndex == entry.key
                                          ? Colors.black
                                          : Colors.grey,
                                    ),
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    ],
                  )
                : CarouselSlider(
                    items: imageList.map((item) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Stack(
                            fit: StackFit.expand,
                            children: [
                              Image.asset(
                                item['image_path']!,
                                fit: BoxFit.cover,
                                width: double.infinity,
                              ),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Container(
                                  padding: EdgeInsets.symmetric(vertical: 0.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children:
                                        imageList.asMap().entries.map((entry) {
                                      return GestureDetector(
                                        onTap: () => _carouselController
                                            .animateToPage(entry.key),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 2.0),
                                          child: Container(
                                            width: currentIndex == entry.key
                                                ? 17
                                                : 7,
                                            height: 10.0,
                                            margin: EdgeInsets.symmetric(
                                                horizontal: 2.0),
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: currentIndex == entry.key
                                                  ? Colors.black
                                                  : Colors.grey,
                                            ),
                                          ),
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    }).toList(),
                    carouselController: _carouselController,
                    options: CarouselOptions(
                      scrollPhysics: BouncingScrollPhysics(),
                      autoPlay: true,
                      aspectRatio: 2.0,
                      viewportFraction: 1.0,
                      onPageChanged: (index, reason) {
                        setState(() {
                          currentIndex = index;
                        });
                      },
                    ),
                  );
          }),
    );
  }
}
