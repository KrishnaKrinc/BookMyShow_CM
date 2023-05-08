import 'package:book_my_show/controllers/location_controller.dart';
import 'package:book_my_show/customs/custom_widgets/custom_inkwell.dart';
import 'package:book_my_show/utils/constants.dart';
import 'package:book_my_show/views/bookingpage.dart';
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
                  color: colorWhite, fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.10),
            const CircularProgressIndicator(
              color: colorWhite,
            ),
          ],
        ),
      ),
    ),
  );
}

// Recommended Movies List Builder
Widget recommendedBuilder(BuildContext context, data, index) {
  double left = index == 0 ? 15 : 10;
  return Padding(
    padding: EdgeInsets.only(left: left),
    child: Row(
      children: [
        CustomInkWell(
          onTap: () {
            print('Recommnended Movies Index ::  $index');
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => BookingPage(
                  data: data,
                  index: index,
                  title: 'mName',
                  type: 'movies',
                ),
              ),
            );
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 220,
                width: 145,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  image: DecorationImage(
                    image: NetworkImage(data[index]['url']),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Container(
                height: 25,
                width: 145,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: colorGrey.shade300,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: const [
                              SizedBox(height: 3.8),
                              Icon(
                                Icons.star_rate_rounded,
                                color: colorRed,
                                size: 16,
                              ),
                            ],
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
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                data[index]['mName'],
                style: const TextStyle(fontWeight: FontWeight.w500),
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

// Custom Scrollable List Builder
Widget customScrollableListBuilder(context, data, index, title) {
  double left = index == 0 ? 15 : 10;
  return Padding(
    padding: EdgeInsets.only(left: left),
    child: Row(
      children: [
        CustomInkWell(
          onTap: () {
            print('$title Index ::  $index');
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => BookingPage(
                  data: data,
                  index: index,
                  title: 'showName',
                  type: 'shows',
                ),
              ),
            );
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 220,
                width: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  image: DecorationImage(
                    image: NetworkImage(data[index]['url']),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Container(
                height: 25,
                width: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: colorGrey.shade300,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        data[index]['liveDate'],
                        style: const TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: 145,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data[index]['showName'],
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      data[index]['otherInfo'],
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 12,
                        color: colorGrey.shade600,
                      ),
                    ),
                  ],
                ),
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
                  image: NetworkImage(e['url']),
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
                    color: colorWhite,
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
                      color: colorWhite,
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
                      color: colorWhite,
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
              backgroundColor: colorRed,
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

// Buzz Builder
Widget buzzBuilder(data, size) {
  return SizedBox(
    height: size.height * 0.18,
    child: ListView.separated(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      itemBuilder: (BuildContext context, index) {
        return Container(
          height: 180,
          width: size.width * 0.80,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            color: colorDarkBlue,
          ),
          child: Card(
            margin: const EdgeInsets.all(8.0),
            color: colorDarkBlue,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 90,
                  height: 90,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    image: DecorationImage(
                      image: NetworkImage(
                        data[index]['url'],
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(
                    left: 8.0,
                    right: 8.0,
                  ),
                  width: size.width * 0.50,
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      maxLines: 5,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                      ),
                      data[index]['otherInfo'] as String,
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
      itemCount: data.length,
      separatorBuilder: (context, index) => const SizedBox(width: 8.0),
    ),
  );
}

// Ad Carousel Slider
Widget adCarouselImages(e, size, index) {
  return Image.network(e[index]);
}

// Home Appbar
PreferredSizeWidget customAppBar(
    Size size, int index, LocationController locationController) {
  return index == 2
      ? AppBar(
          toolbarHeight: size.height / 12,
          backgroundColor: colorDarkBlue,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Hi!',
                    style: TextStyle(
                      fontSize: 22.5,
                      letterSpacing: 0.8,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 5),
                  GestureDetector(
                    onTap: () {
                      print('Edit Profile Pressed');
                    },
                    child: const Text(
                      'Edit Profile',
                      style: TextStyle(
                        fontSize: 12,
                        letterSpacing: 0.8,
                      ),
                    ),
                  ),
                ],
              ),
              const Icon(Icons.person_pin, size: 35),
            ],
          ))
      : AppBar(
          toolbarHeight: size.height / 12,
          backgroundColor: colorDarkBlue,
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

Widget gridBuilder(
  type,
  rightPadding,
  data,
  size,
  maxCrossAxisExtent,
  childAspectRatio,
  crossAxisSpacing,
  mainAxisSpacing,
  scrollDirection,
  physics,
) {
  return GridView.builder(
    primary: true,
    scrollDirection: scrollDirection,
    physics: physics,
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      childAspectRatio: childAspectRatio,
      crossAxisSpacing: crossAxisSpacing,
      mainAxisSpacing: mainAxisSpacing,
    ),
    itemCount: data.length,
    itemBuilder: (BuildContext context, int index) {
      return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              data[index]['url'],
            ),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
      );
    },
  );
}
