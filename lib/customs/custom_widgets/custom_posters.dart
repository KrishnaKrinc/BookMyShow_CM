import 'package:flutter/material.dart';

class CustomPosters extends StatelessWidget {
  const CustomPosters({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 190,
      child: ListView(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        children: <Widget>[
          const SizedBox(width: 10),
          Container(
            color: Colors.red,
            width: 110,
          ),
          const SizedBox(width: 10),
          Container(
            color: Colors.red,
            width: 110,
          ),
          const SizedBox(width: 10),
          Container(
            color: Colors.red,
            width: 110,
          ),
          const SizedBox(width: 10),
          Container(
            color: Colors.red,
            width: 110,
          ),
          const SizedBox(width: 10),
          Container(
            color: Colors.red,
            width: 110,
          ),
          const SizedBox(width: 10),
          Container(
            color: Colors.red,
            width: 110,
          ),
          const SizedBox(width: 10),
          Container(
            color: Colors.red,
            width: 110,
          ),
          const SizedBox(width: 10),
          Container(
            color: Colors.red,
            width: 110,
          ),
          const SizedBox(width: 10),
        ],
      ),
    );
  }
}
