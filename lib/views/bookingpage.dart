import 'package:book_my_show/customs/custom_widgets/custom_inkwell.dart';
import 'package:book_my_show/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BookingPage extends StatelessWidget {
  final data;
  final index;
  final title;
  final type;
  const BookingPage({super.key, this.data, this.index, this.title, this.type});

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
                child: const Icon(Icons.arrow_back_ios, size: 15),
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
                SliverAppBar(
                  pinned: true,
                  expandedHeight: 200,
                  leading: IconButton(
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(
                      Icons.arrow_back_ios,
                    ),
                  ),
                  flexibleSpace: FlexibleSpaceBar(
                    // title: Text(
                    //   data[index]['$title'],
                    //   style: const TextStyle(fontSize: 17),
                    // ),
                    expandedTitleScale: 1,
                    centerTitle: true,
                    background: Column(
                      children: [
                        Container(
                          width: size.width,
                          height: 200,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                data[index]['url'],
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  backgroundColor: colorDarkBlue,
                  actions: [
                    IconButton(
                        highlightColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        onPressed: () {},
                        icon: const Icon(Icons.share_outlined))
                  ],
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      return ListTile(
                        title: Text('Item $index'),
                      );
                    },
                    childCount: 100,
                  ),
                ),
              ],
            ),
    );
  }
}
