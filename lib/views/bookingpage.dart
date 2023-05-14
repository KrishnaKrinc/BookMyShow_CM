import 'package:book_my_show/customs/custom_widgets/custom_inkwell.dart';
import 'package:book_my_show/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BookingPage extends StatelessWidget {
  final data;
  final index;
  final title;
  final type;
  final subtitle;
  const BookingPage(
      {super.key, this.data, this.index, this.title, this.type, this.subtitle});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: type == 'movies'
          ? AppBar(
              systemOverlayStyle: const SystemUiOverlayStyle(
                statusBarColor: colorDarkBlue,
                statusBarIconBrightness: Brightness.light,
                statusBarBrightness: Brightness.dark,
              ),
              backgroundColor: colorWhite,
              foregroundColor: colorBlack,
              elevation: 0.0,
              leading: CustomInkWell(
                child: const Icon(Icons.arrow_back_ios),
                onTap: () => Navigator.pop(context),
              ),
              title: Text(
                data[index]['$title'],
                style: const TextStyle(fontWeight: FontWeight.w500),
              ),
              actions: [
                IconButton(
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  onPressed: () {
                    print('Share in Booking => Index => $index');
                  },
                  icon: const Icon(Icons.share_outlined),
                ),
              ],
            )
          : AppBar(
              systemOverlayStyle: const SystemUiOverlayStyle(
                statusBarColor: colorDarkBlue,
                statusBarIconBrightness: Brightness.light,
                statusBarBrightness: Brightness.dark,
              ),
              backgroundColor: colorDarkBlue,
              toolbarHeight: 0,
              elevation: 0,
            ),
      body: type == 'movies'
          ? SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  children: [
                    Container(
                      width: size.width,
                      height: 180,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: NetworkImage(data[index]['url']),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          : CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                SliverPersistentHeader(
                  delegate: CustomSilverAppBarDelegate(
                    data,
                    index,
                    title,
                    context,
                    size,
                    expandedHeight: 200,
                  ),
                  pinned: true,
                ),
                SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      SizedBox(
                        width: size.width,
                        height: size.height,
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 15,
                            right: 15,
                            top: 15,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: subtitle.length * 8.0,
                                height: 25,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(3),
                                  color: Colors.black,
                                ),
                                child: Center(
                                  child: Text(
                                    subtitle,
                                    style: const TextStyle(
                                      color: colorWhite,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                data[index]['$title'],
                                textAlign: TextAlign.start,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
      bottomNavigationBar: BottomAppBar(
        height: 60,
        child: Container(
          width: size.width,
          decoration: BoxDecoration(
            border: Border.all(color: colorGrey),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('\$299 onwards'),
                SizedBox(
                  height: 40,
                  width: size.width / 2.2,
                  child: ElevatedButton(
                    onPressed: () {
                      print('Book Pressed => $subtitle => Index :: $index');
                    },
                    style: ElevatedButton.styleFrom(backgroundColor: colorRed),
                    child: const Text(
                      'Book',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w400,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomSilverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final data;
  final index;
  final title;
  final context;
  final size;
  final double expandedHeight;

  const CustomSilverAppBarDelegate(
    this.data,
    this.index,
    this.title,
    this.context,
    this.size, {
    required this.expandedHeight,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final top = expandedHeight - shrinkOffset;
    return Stack(
      fit: StackFit.expand,
      children: [
        buildBackground(shrinkOffset),
        buildAppBar(shrinkOffset),
        Positioned(
          top: 3,
          left: 2,
          right: 2,
          child: buildIcons(shrinkOffset),
        ),
      ],
    );
  }

  double appear(double shrinkOffset) => shrinkOffset / expandedHeight;
  double disappear(double shrinkOffset) => 1 - shrinkOffset / expandedHeight;

  Widget buildAppBar(double shrinkOffset) => Opacity(
        opacity: appear(shrinkOffset),
        child: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            data[index]['$title'],
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 18),
          ),
          backgroundColor: colorDarkBlue,
          centerTitle: true,
        ),
      );

  Widget buildBackground(double shrinkOffset) => Opacity(
        opacity: disappear(shrinkOffset),
        child: Image.network(
          data[index]['url'],
          fit: BoxFit.cover,
        ),
      );

  Widget buildIcons(double shrinkOffset) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.arrow_back_ios,
              color: colorWhite,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.share_outlined,
              color: colorWhite,
            ),
          ),
        ],
      );

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => kToolbarHeight + 5;
}
