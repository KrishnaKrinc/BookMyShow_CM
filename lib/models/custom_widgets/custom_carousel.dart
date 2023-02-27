import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CustomCarouselSlider extends StatefulWidget {
  const CustomCarouselSlider({super.key});

  @override
  State<CustomCarouselSlider> createState() => _CustomCarouselSliderState();
}

class _CustomCarouselSliderState extends State<CustomCarouselSlider> {
  List imageList = [
    {"id": 1, "imagePath": 'assets/images/SampleImages (1).jpg'},
    {"id": 2, "imagePath": 'assets/images/SampleImages (2).jpg'},
    {"id": 3, "imagePath": 'assets/images/SampleImages (3).jpg'},
    {"id": 4, "imagePath": 'assets/images/SampleImages (4).jpg'},
    {"id": 5, "imagePath": 'assets/images/SampleImages (5).jpg'},
  ];

  final CarouselController carouselController = CarouselController();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        InkWell(
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          onTap: () {
            print(currentIndex);
          },
          child: CarouselSlider(
            items: imageList
                .map(
                  (item) => Image.asset(
                    item['imagePath'],
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                )
                .toList(),
            carouselController: carouselController,
            options: CarouselOptions(
              scrollPhysics: const BouncingScrollPhysics(),
              autoPlay: true,
              aspectRatio: 1.3,
              viewportFraction: 1,
              enableInfiniteScroll: false,
              onPageChanged: (index, reason) {
                setState(() {
                  currentIndex = index;
                });
              },
            ),
          ),
        ),
        Positioned(
          bottom: 10,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: imageList.asMap().entries.map((entry) {
              print(entry);
              print(entry.key);
              return GestureDetector(
                onTap: () => carouselController.animateToPage(entry.key),
                child: Container(
                  width: currentIndex == entry.key ? 10 : 7,
                  height: currentIndex == entry.key ? 10 : 7,
                  margin: const EdgeInsets.symmetric(
                    horizontal: 3.0
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: currentIndex == entry.key ? Colors.white : Colors.grey
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
