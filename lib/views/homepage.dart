import 'dart:async';
import 'dart:convert';

import 'package:book_my_show/controllers/location_controller.dart';
import 'package:book_my_show/customs/builders/build_function.dart';
import 'package:book_my_show/customs/custom_widgets/custom_inkwell.dart';
import 'package:book_my_show/utils/constants.dart';
import 'package:book_my_show/views/eventspage.dart';
import 'package:book_my_show/views/profilepage.dart';
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
  //Controllers
  final CarouselController carouselController = CarouselController();
  final locationController = Get.put(LocationController());

  //API Feteched Data Lists
  List _movies = [];
  List _recommendedMovies = [];

  //Index of lists
  int _activeCarouselIndex = 0;
  int _activeAdCarouselIndex = 0;
  int _activePageIndex = 0;

  //Required Lists
  //Scrollable Navgation Bar List
  final List<dynamic> _scrollNavBar = [
    ["Movies", "assets/logos/Movies.png"],
    ["Stream", "assets/logos/Stream.png"],
    ["Music", "assets/logos/Music.png"],
    ["Comedy", "assets/logos/Comedy.png"],
    ["Sports", "assets/logos/Sports.png"],
    ["Plays", "assets/logos/Plays.png"],
    ["See All", "assets/logos/SeeAll.png"]
  ];
  //Advertisement Carousel Slider List
  final List<String> _adCarouselImages = [
    "https://images.unsplash.com/photo-1517604931442-7e0c8ed2963c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80",
    "https://images.unsplash.com/photo-1460881680858-30d872d5b530?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=871&q=80",
    "https://images.unsplash.com/photo-1514533212735-5df27d970db0?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=812&q=80"
  ];

  // final List<String> _adCarouselImages = []; // Testing

  // Inital State
  @override
  void initState() {
    readJson(); // loading data from .json
    super.initState();
  }

  // On Bottom Navigation Button Pressed State
  void _onBottomNavItemTapped(int index) {
    if (index != 1) {
      setState(() {
        _activePageIndex = index;
      });
    }
    if (index == 1) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) =>
              EventsPage(locationController: locationController),
        ),
      );
    }
  }

  // Reading Json Local/ API Fetch
  Future<void> readJson() async {
    final String response =
        await rootBundle.loadString('lib/utils/bookmyshow.json');
    final data = await json.decode(response);
    setState(() {
      _movies = data["BuyorRent"];
      _recommendedMovies = data["RecommendedMovies"];
    });

    // Loader with Timer (For Delay)
    Timer(const Duration(seconds: 3), () {
      setState(() {
        _loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return _loading
        ? buildLoader(size, Colors.red)
        : Scaffold(
            // appbar
            appBar: customAppBar(size, _activePageIndex, locationController),

            // Full body part of the Home page
            body: _activePageIndex == 2
                ? const ProfilePage()
                : SingleChildScrollView(
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
                              return carouselItemBuilder(_scrollNavBar, index);
                            },
                            itemCount: _scrollNavBar.length,
                          ),
                        ),

                        // Advertisement Carousel Slider
                        const SizedBox(height: 15),
                        _adCarouselImages.isNotEmpty
                            ? Stack(
                                children: [
                                  CarouselSlider(
                                    items: _adCarouselImages.map(
                                      (e) {
                                        return Container(
                                          width: size.width,
                                          height: size.height,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: NetworkImage(e),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        );
                                      },
                                    ).toList(),
                                    options: CarouselOptions(
                                      viewportFraction: 1,
                                      autoPlay: true,
                                      initialPage: 0,
                                      height: size.height * 0.21,
                                      scrollDirection: Axis.horizontal,
                                      onPageChanged: (index, reason) =>
                                          setState(() =>
                                              _activeAdCarouselIndex = index),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 15,
                                    left: 0,
                                    right: 0,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: _adCarouselImages
                                          .asMap()
                                          .entries
                                          .map((entry) {
                                        //print(entry);
                                        //print(entry.key);
                                        return GestureDetector(
                                          onTap: () => carouselController
                                              .animateToPage(entry.key),
                                          child: Container(
                                            width: _activeAdCarouselIndex ==
                                                    entry.key
                                                ? 7
                                                : 5,
                                            height: _activeAdCarouselIndex ==
                                                    entry.key
                                                ? 7
                                                : 5,
                                            margin: const EdgeInsets.symmetric(
                                                horizontal: 3.0),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                color: _activeAdCarouselIndex ==
                                                        entry.key
                                                    ? Colors.white
                                                    : Colors.grey),
                                          ),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                ],
                              )
                            : const SizedBox(height: 0, width: 0),
                        const SizedBox(height: 25),

                        // Single Banner Add
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Container(
                            height: size.height / 10,
                            width: size.width,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              image: const DecorationImage(
                                image: NetworkImage(
                                  'https://assets-in.bmscdn.com/discovery-catalog/collections/tr:w-1440,h-120:q-80/stream-leadin-web-collection-202210241242.png',
                                ),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 30),

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
                                child: _recommendedMovies.length > 8
                                    ? Row(
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
                                      )
                                    : Opacity(
                                        opacity: 0,
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
                                        ),
                                      ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 15),

                        // Movies List - Scrollable - row
                        SizedBox(
                          height: 280,
                          width: size.width,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            physics: const BouncingScrollPhysics(),
                            itemBuilder: (context, index) {
                              return recommendedBuilder(
                                  _recommendedMovies, index);
                            },
                            itemCount: _recommendedMovies.length,
                          ),
                        ),
                        const SizedBox(height: 20),

                        // The Best events This Week
                        SizedBox(
                          width: size.width,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 15, right: 15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  "The Best Events This Week",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(height: 4.0),
                                Text(
                                  "Monday to Sunday, we got you covered",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black54,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        // Best Events this Week Content

                        // The ultimate Events List

                        //Stream Ad Above carousel
                        Container(
                          height: size.height / 8,
                          width: size.width,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(
                                  'https://assets-in.bmscdn.com/discovery-catalog/collections/tr:w-1440,h-120:q-80/stream-leadin-web-collection-202210241242.png',
                                ),
                                fit: BoxFit.fill,
                              ),
                              color: Color_DarkBlue),
                        ),

                        // Carousel_Slider
                        _movies.isNotEmpty
                            ? Stack(
                                children: <Widget>[
                                  CustomInkWell(
                                    onTap: () {
                                      print(_activeCarouselIndex);
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
                                            _activeCarouselIndex,
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
                                              _activeCarouselIndex = index;
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children:
                                          _movies.asMap().entries.map((entry) {
                                        //print(entry);
                                        //print(entry.key);
                                        return GestureDetector(
                                          onTap: () => carouselController
                                              .animateToPage(entry.key),
                                          child: Container(
                                            width: _activeCarouselIndex ==
                                                    entry.key
                                                ? 10
                                                : 7,
                                            height: _activeCarouselIndex ==
                                                    entry.key
                                                ? 10
                                                : 7,
                                            margin: const EdgeInsets.symmetric(
                                                horizontal: 3.0),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                color: _activeCarouselIndex ==
                                                        entry.key
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

                        //The Best of Live Events

                        // Live Events Scrollable List

                        // Laughter Therapy Scrollable List

                        // Popular Events Scrollable List

                        // Top games and Sports Events Scrollable List

                        //Explore Fun activities Scrollable List

                        //Buzz Scrollable Tiles
                      ],
                    ),
                  ),

            // Bottom Navigation Bar
            bottomNavigationBar: BottomNavigationBar(
              elevation: 20,
              items: <BottomNavigationBarItem>[
                //Home
                BottomNavigationBarItem(
                  icon: Image.asset(
                    'assets/logos/home.png',
                    height: 23,
                    width: 23,
                    color: Colors.grey,
                  ),
                  activeIcon: Image.asset(
                    'assets/logos/home.png',
                    height: 23,
                    width: 23,
                  ),
                  label: 'Home',
                ),
                //Events
                BottomNavigationBarItem(
                  icon: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const <Widget>[
                          Icon(
                            Icons.star_rate_rounded,
                            color: Color_Black,
                            size: 9,
                          ),
                          SizedBox(width: 8),
                        ],
                      ),
                      const Text(
                        'LIVE',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color_Black,
                          fontWeight: FontWeight.bold,
                          letterSpacing: -0.5,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  label: 'Events',
                ),

                //Profile
                const BottomNavigationBarItem(
                  icon: Icon(
                    Icons.person,
                    color: Color_Black,
                    size: 24,
                  ),
                  activeIcon: Icon(
                    Icons.person,
                    color: Colors.red,
                    size: 24,
                  ),
                  label: 'Profile',
                ),
              ],
              currentIndex: _activePageIndex,
              selectedItemColor: Colors.red,
              onTap: _onBottomNavItemTapped,
            ),
          );
  }
}
