import 'package:flutter/material.dart';
import 'package:skynet/core/config/themes/app_colors.dart';

class HomeCards extends StatelessWidget {
  final String img;
  const HomeCards({
    super.key,
    required this.img
  });

  @override
  Widget build(BuildContext context) { // Card for listView horizonal
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(colors: AppColors.gradientColor),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: Container(
          width: 170,
          height: 100,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(15),
              image: DecorationImage(image: NetworkImage(img))),
        ),
      ),
    );
  }
}
