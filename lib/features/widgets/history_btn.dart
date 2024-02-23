import 'package:flutter/material.dart';
import 'package:skynet/core/config/themes/app_colors.dart';
import 'package:skynet/core/config/themes/app_fonts.dart';

class HistoryBtn extends StatelessWidget {
  const HistoryBtn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            blurRadius: 10,
            color: AppColors.lightGrey.withOpacity(0.1),
            spreadRadius: 1,
            offset: const Offset(1, 0))
      ]),
      child: ElevatedButton(
          onPressed: () {
            debugPrint("work History button");
          },
          style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.white,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              )),
          child: Row(
            children: [
              ShaderMask(
                blendMode: BlendMode.srcIn,
                shaderCallback: (Rect bounds) =>
                    const RadialGradient(
                  center: Alignment.topCenter,
                  stops: [.5, 1],
                  colors: AppColors.gradientColor,
                ).createShader(bounds),
                child: const Icon(
                  Icons.history,
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              Text(
                "История операций по счет",
                style: AppFonts.s16w700
                    .copyWith(color: AppColors.black),
              )
            ],
          )),
    );
  }
}

