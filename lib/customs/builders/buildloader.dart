import 'package:book_my_show/customs/custom_widgets/custom_inkwell.dart';
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
              'assets/logos/bmsFullLogo.png',
              width: size.width / 1.2,
              fit: BoxFit.cover,
              height: size.height * 0.12,
            ),
            const SizedBox(height: 15.0),
            const Text(
              'It All Starts Here',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.10),
            const CircularProgressIndicator(
              color: Colors.white,
            ),
          ],
        ),
      ),
    ),
  );
}

Widget itemBuilder(data, index) {
  return SizedBox(
    width: 73,
    child: Column(
      children: [
        CustomInkWell(
          child: Image.asset(data[index][0]),
        ),
      ],
    ),
  );
}
