import 'package:flutter/material.dart';
import 'package:skynet/core/config/themes/app_colors.dart';
import 'package:skynet/core/config/themes/app_fonts.dart';

class HomeCards extends StatelessWidget {
  final String img;
  final String title;
  final String text;
  const HomeCards(
      {super.key, required this.img, required this.text, required this.title});

  @override
  Widget build(BuildContext context) {
    // Card for listView horizonal
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
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(image: NetworkImage(img))),
          child: Padding(
            padding: const EdgeInsets.all(13.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  title,
                  style: AppFonts.s16w700,
                ),
                Text(
                  text,
                  style: AppFonts.s12w700,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
