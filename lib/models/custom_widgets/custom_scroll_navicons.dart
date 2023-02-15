import 'package:flutter/material.dart';

class CustomScrollNavIcons extends StatelessWidget {
  final String imagePath;
  const CustomScrollNavIcons({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      imagePath,
      height: 60,
      width: 60,
      fit: BoxFit.fitHeight,
    );
  }
}
