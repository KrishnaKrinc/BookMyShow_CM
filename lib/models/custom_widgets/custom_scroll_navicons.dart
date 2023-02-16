import 'package:book_my_show/models/custom_widgets/custom_inkwell.dart';
import 'package:flutter/material.dart';

class CustomScrollNavIcons extends StatelessWidget {
  final Function() onTap;
  final String imagePath;
  const CustomScrollNavIcons({super.key, required this.imagePath, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return CustomInkWell(
      onTap: onTap,
      child: Image.asset(
        imagePath,
        height: 60,
        width: 60,
        fit: BoxFit.fitHeight,
      ),
    );
  }
}
