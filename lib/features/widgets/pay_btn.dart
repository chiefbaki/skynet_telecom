import 'package:flutter/material.dart';
import 'package:skynet/core/config/themes/app_colors.dart';
import 'package:skynet/core/config/themes/app_fonts.dart';

class PayBtn extends StatelessWidget {
  const PayBtn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        debugPrint("work Pay button");
      },
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: const LinearGradient(
                colors: AppColors.gradientColor)),
        child: Padding(
          padding: const EdgeInsets.all(3.0),
          child: Container(
            decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(15)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
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
                      Icons.account_balance_wallet_rounded,
                      size: 33,
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Оплатить за интернет",
                        style: AppFonts.s16w700,
                      ),
                      Text(
                        "Онлайн перевод",
                        style: AppFonts.s12w700.copyWith(
                            color: AppColors.lightGrey),
                      ),
                    ],
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
