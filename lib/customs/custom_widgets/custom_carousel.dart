import 'package:book_my_show/utils/constants.dart';
import 'package:flutter/material.dart';

Widget customCarouselSlider(e, size, margin, activeCarouselIndex) {
  return SizedBox(
    width: size.width,
    height: size.height * 0.46,
    child: Card(
      margin: EdgeInsets.zero,
      color: Color_DarkBlue,
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: margin, left: margin + 2.0),
                child: Container(
                  height: size.height * 0.305,
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
              const SizedBox(width: 16.0),
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
          const SizedBox(height: 10),
          SizedBox(
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
        ],
      ),
    ),
  );
}
