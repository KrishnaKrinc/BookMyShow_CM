import 'package:book_my_show/customs/builders/build_function.dart';
import 'package:book_my_show/utils/constants.dart';
import 'package:flutter/material.dart';

class CustomScrollableListBuilder extends StatelessWidget {
  final data;
  final type;
  final size;
  final title;

  const CustomScrollableListBuilder(
      {super.key, this.data, this.type, this.size, this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              // Recommended Text
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              // Text Button for see all option
              InkWell(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () {
                  print('See All');
                },
                child: data.length > 8
                    ? Row(
                        children: const <Widget>[
                          Text(
                            'See All',
                            style: TextStyle(
                              color: Color_Red,
                              fontWeight: FontWeight.w500,
                            ),
                            textAlign: TextAlign.right,
                          ),
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            size: 8,
                            color: Color_Red,
                          ),
                        ],
                      )
                    : Opacity(
                        opacity: 0,
                        child: Row(
                          children: const <Widget>[
                            Text(
                              'See All',
                              style: TextStyle(
                                color: Color_Red,
                                fontWeight: FontWeight.w500,
                              ),
                              textAlign: TextAlign.right,
                            ),
                            Icon(
                              Icons.arrow_forward_ios_rounded,
                              size: 8,
                              color: Color_Red,
                            ),
                          ],
                        ),
                      ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 15),

        // Movies List - Scrollable - row
        SizedBox(
          height: 280,
          width: size.width,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return recommendedBuilder(data, index);
            },
            itemCount: data.length,
          ),
        ),
        const SizedBox(height: 20)
      ],
    );
  }
}
