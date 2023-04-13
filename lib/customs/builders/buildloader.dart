import 'package:book_my_show/customs/custom_widgets/custom_inkwell.dart';
import 'package:book_my_show/utils/constants.dart';
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
    child: CustomInkWell(
      child: Image.asset(data[index][1]),
      onTap: () {
        print(data[index][0]);
      },
    ),
  );
}

Widget recommendedBuilder(data, index) {
  double left = index == 0 ? 15 : 10;
  return Padding(
    padding: EdgeInsets.only(left: left),
    child: Row(
      children: [
        CustomInkWell(
          onTap: () {
            print('Recommnended Movies Index ::  $index');
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 210,
                width: 125,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  image: DecorationImage(
                    image: NetworkImage(data[index]['imagePath']),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              const SizedBox(height: 5),
              Container(
                height: 25,
                width: 125,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: Colors.grey[300],
                ),
                child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Icon(
                              Icons.star_rate_rounded,
                              color: Colors.red,
                              size: 16,
                            ),
                            Text(
                              '${data[index]['Rating']}',
                              style: const TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                        Text(
                          '${formatNumber(data[index]['Votes'])} votes',
                          style: const TextStyle(fontSize: 12),
                        ),
                      ],
                    )),
              ),
              const SizedBox(height: 5),
              Text(
                data[index]['mName'],
              ),
            ],
          ),
        ),
        index == data.length - 1
            ? const SizedBox(width: 15)
            : const SizedBox(width: 0),
      ],
    ),
  );
}
