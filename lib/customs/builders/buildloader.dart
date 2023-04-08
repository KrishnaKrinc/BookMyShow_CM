import 'package:flutter/material.dart';

Widget buildLoader(Size size, Color color) {
  return SafeArea(
      child: Scaffold(
    body: Container(
      width: size.width,
      height: size.height,
      alignment: Alignment.center,
      color: color,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/logos/bms_logo.png',
            width: size.width,
            fit: BoxFit.cover,
            height: size.height * 0.12,
          ),
          const SizedBox(height: 8.0),
          const Text(
            'It All Starts Here',
          ),
          SizedBox(height: size.height * 0.10),
          const CircularProgressIndicator(
            color: Colors.white,
          ),
        ],
      ),
    ),
  ));
}
