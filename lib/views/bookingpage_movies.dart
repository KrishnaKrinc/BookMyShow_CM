import 'package:book_my_show/customs/custom_widgets/custom_inkwell.dart';
import 'package:book_my_show/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BookingPageMovies extends StatelessWidget {
  final data;
  final index;
  final title;
  const BookingPageMovies({super.key, this.data, this.index, this.title});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
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
      ),
      body: SingleChildScrollView(
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
      )),
    );
  }
}
