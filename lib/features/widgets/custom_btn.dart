import 'package:flutter/material.dart';
import 'package:skynet/core/config/themes/app_colors.dart';
import 'package:skynet/core/config/themes/app_fonts.dart';

class CustomBtn extends StatelessWidget {
  final Function() onTap;
  final IconData icon;
  final String title;
  final String text;
  const CustomBtn({
    super.key,
    required this.onTap,
    required this.icon,
    required this.title,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          gradient: const LinearGradient(
              colors: AppColors.gradientColor),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.all(3.0),
          child: Container(
            width: 150,
            height: 100,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ShaderMask(
                    blendMode: BlendMode.srcIn,
                    shaderCallback: (Rect bounds) =>
                        const RadialGradient(
                      center: Alignment.topCenter,
                      stops: [.5, 1],
                      colors: AppColors.gradientColor,
                    ).createShader(bounds),
                    child: Icon(
                      icon,
                    ),
                  ),
                  Text(
                    title,
                    style: AppFonts.s16w700,
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Text(
                    text,
                    style: AppFonts.s10w700
                        .copyWith(color: AppColors.lightGrey),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
