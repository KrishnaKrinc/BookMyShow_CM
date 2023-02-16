import 'package:book_my_show/controllers/location_controller.dart';
import 'package:book_my_show/models/custom_widgets/custom_inkwell.dart';
import 'package:book_my_show/models/custom_widgets/custom_scroll_navicons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends GetView<LocationController> {
  HomePage({super.key});
  final locationController = Get.put(LocationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appbar
      appBar: AppBar(
        toolbarHeight: 65,
        backgroundColor: const Color.fromARGB(255, 46, 49, 71),
        //title row of text and icons
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            // Column for text and location
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // header Text
                const Text(
                  'It All Starts Here',
                  style: TextStyle(
                    fontSize: 22.5,
                    letterSpacing: 0.8,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                // reactive widget of the user region
                Obx(
                  () => Text(
                    controller.city.value,
                    style: const TextStyle(fontSize: 12),
                  ),
                ),
              ],
            ),
            const Opacity(
              opacity: 0.0,
              child: Icon(Icons.search),
            ),
            //icons
            // search icon
            CustomInkWell(
              child: const Icon(
                Icons.search_sharp,
                size: 26,
              ),
              onTap: () {
                print('Search');
              },
            ),
            // Notification
            CustomInkWell(
              child: const Icon(
                Icons.notifications_none_rounded,
                size: 26,
              ),
              onTap: () {
                print('Notification');
              },
            ),
            // Qr Scanner Icon
            CustomInkWell(
              child: const Icon(
                Icons.qr_code_scanner_outlined,
                size: 26,
              ),
              onTap: () {
                print('QR code');
              },
            ),
          ],
        ),
      ),
      body: Column(
        children: <Widget>[
          // Options list - scrollable - row
          const SizedBox(height: 10),
          SizedBox(
            height: 75,
            child: ListView(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              children: <Widget>[
                const SizedBox(width: 10),
                CustomScrollNavIcons(
                  imagePath: 'assets/Movies.png',
                  onTap: () {
                    print('Movies');
                  },
                ),
                const SizedBox(width: 10),
                CustomScrollNavIcons(
                  imagePath: 'assets/Stream.png',
                  onTap: () {
                    print('Stream');
                  },
                ),
                const SizedBox(width: 10),
                CustomScrollNavIcons(
                  imagePath: 'assets/Music.png',
                  onTap: () {
                    print('Music');
                  },
                ),
                const SizedBox(width: 10),
                CustomScrollNavIcons(
                  imagePath: 'assets/Comedy.png',
                  onTap: () {
                    print('Comedy');
                  },
                ),
                const SizedBox(width: 10),
                CustomScrollNavIcons(
                  imagePath: 'assets/Sports.png',
                  onTap: () {
                    print('Sports');
                  },
                ),
                const SizedBox(width: 10),
                CustomScrollNavIcons(
                  imagePath: 'assets/Plays.png',
                  onTap: () {
                    print('Plays');
                  },
                ),
                const SizedBox(width: 10),
                CustomScrollNavIcons(
                  imagePath: 'assets/SeeAll.png',
                  onTap: () {
                    print('SeeAll');
                  },
                ),
                const SizedBox(width: 10),
              ],
            ),
          ),
          const SizedBox(height: 15),

          // Recommended and See all row
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                // Recommended Text
                const Text(
                  'Recommended Movies',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                // Text Button for see all option
                InkWell(
                    onTap: () {
                      print('See All');
                    },
                    child: Row(
                      children: const <Widget>[
                        Text(
                          'See All',
                          style: TextStyle(
                              color: Colors.red, fontWeight: FontWeight.w500),
                          textAlign: TextAlign.right,
                        ),
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 8,
                          color: Colors.red,
                        ),
                      ],
                    )),
              ],
            ),
          ),
          const SizedBox(height: 15),

          // Movies List - Scrollable - row
          SizedBox(
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
          ),
        ],
      ),
    );
  }
}
