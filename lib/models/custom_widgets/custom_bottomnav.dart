import 'package:book_my_show/utils/constants.dart';
import 'package:flutter/material.dart';

class CustomBottomNav extends StatelessWidget {
  const CustomBottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return SizedBox(
          height: screenHeight/12,
          child: Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                InkWell(
                  onTap: () {},
                  child: Column(
                    children: <Widget>[
                      Image.asset(
                        'assets/logos/home.png',
                        height: 26,
                        width: 26,
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
                InkWell(
                  onTap: () {},
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: const <Widget>[
                          Icon(
                            Icons.star_rate_rounded,
                            color: Color_Black,
                            size: 11,
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
                          fontSize: 14,
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
                InkWell(
                  onTap: () {},
                  child: Column(
                    children: const <Widget>[
                      Icon(
                        Icons.person,
                        color: Color_Black,
                        size: 28,
                      ),
                      SizedBox(height: 5.5),
                      Text(
                        'Profile',
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
  }
}