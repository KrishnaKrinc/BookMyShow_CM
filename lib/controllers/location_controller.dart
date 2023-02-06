import 'dart:async';

import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class LocationController extends GetxController {
  var latitute = ''.obs;
  var longitude = ''.obs;
  var city = ''.obs;
  late StreamSubscription<Position> streamSubscription;

  @override
  void onInit() async {
    super.onInit();
    getLocation();
  }

  getLocation() async {
    bool serviceEnabled;

    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
      }
    }
    if (permission == LocationPermission.deniedForever) {
      permission = await Geolocator.requestPermission();
    }

    streamSubscription =
        Geolocator.getPositionStream().listen((Position position) {
      latitute.value = '${position.latitude}';
      longitude.value = '${position.longitude}';
      getAddressFromLatLong(position);
    });
  }

  Future<void> getAddressFromLatLong(Position position) async {
    List<Placemark> placemark =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    Placemark place = placemark[0];
    city.value = '${place.locality}';
  }
}
