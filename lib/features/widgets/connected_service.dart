
import 'package:flutter/material.dart';
import 'package:skynet/core/config/themes/app_colors.dart';
import 'package:skynet/core/config/themes/app_fonts.dart';

class ConnectedServices extends StatelessWidget {
  final String title;
  const ConnectedServices({
    super.key,
    required this.title
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            gradient: const LinearGradient(colors: AppColors.gradientColor),
            borderRadius: BorderRadius.circular(25)
          ),
          child: const Icon(Icons.tv, color: AppColors.white,),
        ),
        const SizedBox(
          width: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: AppFonts.s16w700,),
            Text("Оплачено", style: AppFonts.s16w700.copyWith(color: AppColors.green),)
          ],
        )
      ],
    );
  }
}

