import 'package:flutter/material.dart';

Widget customCarouselSlider(e, size, margin, activeCarouselIndex) {
  return Stack(
    alignment: AlignmentDirectional.topCenter,
    children: [
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 18),
            child: Container(
              height: 260,
              width: size.width / 2.4,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                image: DecorationImage(
                  image: NetworkImage(e['imagePath']),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          const SizedBox(width: 20.0),
          SizedBox(
            width: size.width * 0.48,
            height: size.height * 0.35,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 18.0),
                Text(
                  e['mName'],
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.5,
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: size.width / 2.5,
                  height: size.height / 10,
                  child: Text(
                    "${e['time']} • ${e['genre']} • ${e['Rated']}\n${e['lang']}",
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.5,
                      height: 1.5,
                    ),
                  ),
                ),
                SizedBox(
                  width: size.width / 2.5,
                  height: size.height / 10,
                  child: Text(
                    "${e['discription']}",
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
          ),
        ],
      ),
      Positioned(
        bottom: 45,
        child: SizedBox(
          height: 40,
          width: size.width / 1.1,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              surfaceTintColor: Colors.transparent,
              elevation: null,
            ),
            onPressed: () {
              print("Buy or Rent $activeCarouselIndex");
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
      ),
    ],
  );
}
