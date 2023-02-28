import 'package:flutter/material.dart';

class CustomCarouselContent extends StatelessWidget {
  final item;
  const CustomCarouselContent({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                item['imagePath'],
                fit: BoxFit.fill,
                height: 260,
                width: 178,
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        SizedBox(
          height: 40,
          width: double.infinity,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red, elevation: null),
            onPressed: () {
              print("Buy or Rent");
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
    );
  }
}
