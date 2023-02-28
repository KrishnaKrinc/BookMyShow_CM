import 'package:book_my_show/models/custom_widgets/custom_carousel_content.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CustomCarouselSlider extends StatefulWidget {
  const CustomCarouselSlider({super.key});

  @override
  State<CustomCarouselSlider> createState() => _CustomCarouselSliderState();
}

class _CustomCarouselSliderState extends State<CustomCarouselSlider> {
  static List imageList = [
    {
      "id": 1,
      "imagePath": 'assets/images/SampleImages (1).jpg',
      "mName": "Test1",
      "time": "3h 0m",
      "genre": "Action",
      "Rated": "18+",
      "lang": "English"
    },
    {
      "id": 2,
      "imagePath": 'assets/images/SampleImages (2).jpg',
      "mName": "Test2",
      "time": "2h 30m",
      "genre": "Thriller",
      "Rated": "UA",
      "lang": "English"
    },
    {
      "id": 3,
      "imagePath": 'assets/images/SampleImages (3).jpg',
      "mName": "Test3",
      "time": "2h 20m",
      "genre": "Romance",
      "Rated": "18+",
      "lang": "English"
    },
    {
      "id": 4,
      "imagePath": 'assets/images/SampleImages (4).jpg',
      "mName": "Test4",
      "time": "1h 49m",
      "genre": "Comedy",
      "Rated": "UA",
      "lang": "English"
    },
    {
      "id": 5,
      "imagePath": 'assets/images/SampleImages (5).jpg',
      "mName": "Test5",
      "time": "2h 20m",
      "genre": "Sci-Fi",
      "Rated": "UA",
      "lang": "English"
    },
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
          child: Container(
            color: const Color.fromARGB(255, 46, 49, 71),
            child: CarouselSlider(
              items: imageList
                  .map(
                    (item) => Padding(
                      padding: const EdgeInsets.only(
                        top: 25,
                        left: 15,
                        right: 15,
                      ),
                      child: CustomCarouselContent(
                        imageList: imageList,
                        currentIndex: currentIndex,
                      ),
                    ),
                  )
                  .toList(),
              carouselController: carouselController,
              options: CarouselOptions(
                scrollPhysics: const BouncingScrollPhysics(),
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 3),
                aspectRatio: 1,
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
        ),
        Positioned(
          bottom: 10,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: imageList.asMap().entries.map((entry) {
              //print(entry);
              //print(entry.key);
              return GestureDetector(
                onTap: () => carouselController.animateToPage(entry.key),
                child: Container(
                  width: currentIndex == entry.key ? 10 : 7,
                  height: currentIndex == entry.key ? 10 : 7,
                  margin: const EdgeInsets.symmetric(horizontal: 3.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: currentIndex == entry.key
                          ? Colors.white
                          : Colors.grey),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
