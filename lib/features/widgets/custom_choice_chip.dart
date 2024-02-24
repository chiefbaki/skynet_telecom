import 'package:flutter/material.dart';
import 'package:skynet/core/config/themes/app_colors.dart';

import '../../core/config/themes/app_fonts.dart';

class CustomChoiceChip extends StatefulWidget {
  final String title;
  final IconData icon;
  final int index;
  const CustomChoiceChip({super.key, required this.title, required this.icon, required this.index});

  @override
  State<CustomChoiceChip> createState() => _CustomChoiceChipState();
}

class _CustomChoiceChipState extends State<CustomChoiceChip> {
  int selectedIndex = 0;
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        selectedIndex = widget.index;

        setState(() {});
      },
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: selectedIndex == widget.index
                    ? AppColors.gradientColor
                    : AppColors.whiteGradient),
            borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Container(
            decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Row(
                  children: [
                    ShaderMask(
                      blendMode: BlendMode.srcIn,
                      shaderCallback: (Rect bounds) => const RadialGradient(
                        center: Alignment.topCenter,
                        stops: [.5, 1],
                        colors: AppColors.gradientColor,
                      ).createShader(bounds),
                      child: Icon(
                        widget.icon,
                        size: 22,
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      widget.title,
                      style: AppFonts.s12w700,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
