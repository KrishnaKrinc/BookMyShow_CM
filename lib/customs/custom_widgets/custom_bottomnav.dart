import 'package:book_my_show/utils/constants.dart';
import 'package:flutter/material.dart';

class CustomBottomNav extends StatelessWidget {
  const CustomBottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      height: 60,
      child: Padding(
        padding: const EdgeInsets.only(top: 10, bottom: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            SizedBox(
              width: screenWidth / 3,
              child: InkWell(
                onTap: () {
                  print("HOME");
                },
                child: Column(
                  children: <Widget>[
                    Image.asset(
                      'assets/logos/home.png',
                      height: 20,
                      width: 20,
                    ),
                    const SizedBox(height: 6),
                    const Text(
                      'Home',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color_Red,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: screenWidth / 3,
              child: InkWell(
                onTap: () {
                  print("LIVE");
                },
                child: Column(
                  children: <Widget>[
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
                    const SizedBox(height: 5.5),
                    const Text(
                      'Events',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: screenWidth / 3,
              child: InkWell(
                onTap: () {
                  print("PROFILE");
                },
                child: Column(
                  children: const <Widget>[
                    Icon(
                      Icons.person,
                      color: Color_Black,
                      size: 24,
                    ),
                    SizedBox(height: 4.5),
                    Text(
                      'Profile',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
