import 'package:book_my_show/controllers/location_controller.dart';
import 'package:book_my_show/customs/custom_widgets/custom_inkwell.dart';
import 'package:book_my_show/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EventsPage extends StatelessWidget {
  final LocationController locationController;
  const EventsPage({super.key, required this.locationController});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: CustomInkWell(
          child: const Icon(Icons.arrow_back_ios),
          onTap: () => Navigator.pop(context),
        ),
        toolbarHeight: size.height / 12,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Experience begins here',
              style: TextStyle(
                fontSize: 18,
                letterSpacing: 0.8,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 5),
            Obx(
              () => Text(
                locationController.city.value,
                style: const TextStyle(fontSize: 12),
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onPressed: () => print("Search Clicked"),
            icon: const Icon(Icons.search),
            color: colorWhite,
          ),
        ],
        backgroundColor: colorDarkBlue,
        titleSpacing: 0,
      ),
      body: const Text("Events"),
    );
  }
}
