import 'dart:async';
import 'dart:convert';

import 'package:book_my_show/controllers/location_controller.dart';
import 'package:book_my_show/customs/builders/buil_functions.dart';
import 'package:book_my_show/customs/custom_widgets/custom_bottomnav.dart';
import 'package:book_my_show/customs/custom_widgets/custom_inkwell.dart';
import 'package:book_my_show/utils/constants.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

bool _loading = true;

class _HomePageState extends State<HomePage> {
  final CarouselController carouselController = CarouselController();
  List _movies = [];
  int activeCarouselIndex = 0;

  final List<dynamic> _scrollNavBar = [
    ["Movies", "assets/logos/Movies.png"],
    ["Stream", "assets/logos/Stream.png"],
    ["Music", "assets/logos/Music.png"],
    ["Comedy", "assets/logos/Comedy.png"],
    ["Sprots", "assets/logos/Sports.png"],
    ["Plays", "assets/logos/Plays.png"],
    ["See All", "assets/logos/SeeAll.png"]
  ];

  @override
  void initState() {
    readJson(); // loading data from .json
    super.initState();
  }

  Future<void> readJson() async {
    final String response =
        await rootBundle.loadString('lib/utils/bookmyshow.json');
    final data = await json.decode(response);
    setState(() {
      _movies = data["movies"];
    });

    Timer(const Duration(seconds: 3), () {
      setState(() {
        _loading = false;
      });
    });
  }

  final locationController = Get.put(LocationController());

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return _loading
        ? buildLoader(size, Colors.red)
        : Scaffold(
            // appbar
            appBar: AppBar(
              toolbarHeight: size.height / 12,
              backgroundColor: Color_DarkBlue,
              //title row of text and icons
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  // Column for text and location
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      // header Text
                      const Text(
                        'It All Starts Here',
                        style: TextStyle(
                          fontSize: 22.5,
                          letterSpacing: 0.8,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      // reactive widget of the user region
                      Obx(
                        () => Text(
                          locationController.city.value,
                          style: const TextStyle(fontSize: 12),
                        ),
                      ),
                    ],
                  ),
                  const Opacity(
                    opacity: 0.0,
                    child: Icon(Icons.search),
                  ),
                  //icons
                  // search icon
                  CustomInkWell(
                    child: const Icon(
                      Icons.search_sharp,
                      size: 26,
                    ),
                    onTap: () {
                      print('Search');
                    },
                  ),
                  // Notification
                  CustomInkWell(
                    child: const Icon(
                      Icons.notifications_none_rounded,
                      size: 26,
                    ),
                    onTap: () {
                      print('Notification');
                    },
                  ),
                  // Qr Scanner Icon
                  CustomInkWell(
                    child: const Icon(
                      Icons.qr_code_scanner_outlined,
                      size: 26,
                    ),
                    onTap: () {
                      print('QR code');
                    },
                  ),
                ],
              ),
            ),

            // Full body part of the Home page
            body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: <Widget>[
                  // Options list - scrollable - row
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 75,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return itemBuilder(_scrollNavBar, index);
                      },
                      itemCount: _scrollNavBar.length,
                    ),
                  ),
                  const SizedBox(height: 9),

                  // Recommended and See all row
                  Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        // Recommended Text
                        const Text(
                          'Recommended Movies',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        // Text Button for see all option
                        InkWell(
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () {
                              print('See All');
                            },
                            child: Row(
                              children: const <Widget>[
                                Text(
                                  'See All',
                                  style: TextStyle(
                                    color: Color_Red,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  textAlign: TextAlign.right,
                                ),
                                Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  size: 8,
                                  color: Color_Red,
                                ),
                              ],
                            )),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Movies List - Scrollable - row
                  SizedBox(
                    height: 280,
                    width: size.width,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return recommendedBuilder(_movies, index);
                      },
                      itemCount: _movies.length,
                    ),
                  ),

                  // Carousel_Slider
                  const SizedBox(height: 15),
                  _movies.isNotEmpty
                      ? Stack(
                          children: <Widget>[
                            CustomInkWell(
                              onTap: () {
                                print(activeCarouselIndex);
                              },
                              child: Container(
                                color: Color_DarkBlue,
                                height: 400,
                                width: size.width,
                                child: CarouselSlider(
                                  items: _movies.map((e) {
                                    return customCarouselSlider(
                                      e,
                                      size,
                                      18.0,
                                      activeCarouselIndex,
                                    );
                                  }).toList(),
                                  carouselController: carouselController,
                                  options: CarouselOptions(
                                    scrollPhysics:
                                        const BouncingScrollPhysics(),
                                    autoPlay: true,
                                    autoPlayInterval:
                                        const Duration(seconds: 3),
                                    aspectRatio: 1,
                                    viewportFraction: 1,
                                    enableInfiniteScroll: false,
                                    onPageChanged: (index, reason) {
                                      setState(() {
                                        activeCarouselIndex = index;
                                      });
                                    },
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 20,
                              left: 0,
                              right: 0,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: _movies.asMap().entries.map((entry) {
                                  //print(entry);
                                  //print(entry.key);
                                  return GestureDetector(
                                    onTap: () => carouselController
                                        .animateToPage(entry.key),
                                    child: Container(
                                      width: activeCarouselIndex == entry.key
                                          ? 10
                                          : 7,
                                      height: activeCarouselIndex == entry.key
                                          ? 10
                                          : 7,
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 3.0),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color:
                                              activeCarouselIndex == entry.key
                                                  ? Colors.white
                                                  : Colors.grey),
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),
                          ],
                        )
                      : const Center(
                          child: CircularProgressIndicator(),
                        ),
                  const SizedBox(height: 15),
                  const SizedBox(height: 15),
                ],
              ),
            ),
            bottomNavigationBar: const BottomAppBar(
              color: Color_White,
              elevation: 50,
              child: CustomBottomNav(),
            ),
          );
  }
}
