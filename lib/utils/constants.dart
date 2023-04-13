import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

const Color_DarkBlue = Color.fromARGB(255, 46, 49, 71);
const Color_White = Colors.white;
const Color_Red = Colors.red;
const Color_Black = Colors.black54;

String formatNumber(int number) {
  return NumberFormat.compact().format(number);
}
