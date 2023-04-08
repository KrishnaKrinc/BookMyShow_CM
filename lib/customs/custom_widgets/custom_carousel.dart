import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CustomCarouselSlider extends StatefulWidget {
  final List moviesList;
  const CustomCarouselSlider({Key? mykey, required this.moviesList})
      : super(key: mykey);

  @override
  State<CustomCarouselSlider> createState() => _CustomCarouselSliderState();
}

class _CustomCarouselSliderState extends State<CustomCarouselSlider> {
  final CarouselController carouselController = CarouselController();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
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
              items: widget.moviesList
                  .map(
                    (item) => Padding(
                      padding: const EdgeInsets.only(
                        top: 25,
                        left: 15,
                        right: 15,
                      ),
                      child: Column(
                        children: <Widget>[
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Image.asset(
                                  widget.moviesList[currentIndex]['imagePath'],
                                  fit: BoxFit.fill,
                                  height: 260,
                                  width: screenWidth / 2.2,
                                ),
                              ),
                              const SizedBox(width: 20),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  const SizedBox(height: 20),
                                  Text(
                                    widget.moviesList[currentIndex]['mName'],
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 0.5,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  SizedBox(
                                    width: screenWidth / 2.5,
                                    height: screenHeight / 10,
                                    child: Text(
                                      "${widget.moviesList[currentIndex]['time']} • ${widget.moviesList[currentIndex]['genre']} • ${widget.moviesList[currentIndex]['Rated']}\n${widget.moviesList[currentIndex]['lang']}",
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          letterSpacing: 0.5,
                                          height: 1.5),
                                    ),
                                  ),
                                  SizedBox(
                                    width: screenWidth / 2.5,
                                    height: screenHeight / 10,
                                    child: Text(
                                      "${widget.moviesList[currentIndex]['discription']}",
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        letterSpacing: 0.5,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          SizedBox(
                            height: 40,
                            width: double.infinity,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red,
                                surfaceTintColor: Colors.transparent,
                                elevation: null,
                              ),
                              onPressed: () {
                                print("Buy or Rent $currentIndex");
                              },
                              child: const Text(
                                "Buy or Rent",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                  letterSpacing: 0.8,
                                ),
                              ),
                            ),
                          ),
                        ],
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
          bottom: 18,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: widget.moviesList.asMap().entries.map((entry) {
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
