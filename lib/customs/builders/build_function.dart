import 'package:book_my_show/controllers/location_controller.dart';
import 'package:book_my_show/customs/custom_widgets/custom_inkwell.dart';
import 'package:book_my_show/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


// Splash Screen and Loader
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

// Recommended Movies List Builder
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

// Carousell Item Builder
Widget carouselItemBuilder(data, index) {
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

// Carousel Slider Build
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

// Home Appbar
PreferredSizeWidget customAppBar(
    Size size, int index, LocationController locationController) {
  return index == 2
      ? AppBar(
          toolbarHeight: size.height / 12,
          backgroundColor: Color_DarkBlue,
          title: const Text(
            'Hey!',
            style: TextStyle(
              fontSize: 22.5,
              letterSpacing: 0.8,
              fontWeight: FontWeight.w600,
            ),
          ),
        )
      : AppBar(
          toolbarHeight: size.height / 12,
          backgroundColor: Color_DarkBlue,
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
                      locationController.city.value,
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
        );
}
