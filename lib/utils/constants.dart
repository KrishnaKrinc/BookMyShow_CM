import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

const colorDarkBlue = Color.fromARGB(255, 46, 49, 71);
const colorWhite = Colors.white;
const colorRed = Colors.red;
const colorBlack = Colors.black54;
const colorGrey = Colors.grey;

String formatNumber(int number) {
  return NumberFormat.compact().format(number);
}
