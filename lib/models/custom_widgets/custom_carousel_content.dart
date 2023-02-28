import 'package:flutter/material.dart';

class CustomCarouselContent extends StatelessWidget {
  final List imageList;
  final int currentIndex;
  const CustomCarouselContent(
      {super.key, required this.imageList, required this.currentIndex});

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
                imageList[currentIndex]['imagePath'],
                fit: BoxFit.fill,
                height: 270,
                width: 178,
              ),
            ),
            const SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  imageList[currentIndex]['mName'],
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.5,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  " ${imageList[currentIndex]['time']} • ${imageList[currentIndex]['genre']} • ${imageList[currentIndex]['Rated']}",
                  textAlign: TextAlign.left,
                  overflow: TextOverflow.clip,
                  softWrap: false,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w600),
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
    );
  }
}
