import 'package:flutter/material.dart';
import 'package:skynet/core/config/themes/app_colors.dart';
import 'package:skynet/core/config/themes/app_fonts.dart';

class CopyBtn extends StatelessWidget {
  final String personalAcc;
  const CopyBtn({
    super.key,
    required this.personalAcc
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
                blurRadius: 10,
                color: AppColors.lightGrey
                    .withOpacity(0.1),
                spreadRadius: 1,
                offset: const Offset(1, -2))
          ]),
      child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
              shadowColor: AppColors.black,
              backgroundColor: AppColors.white,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(15),
              )),
          child: Row(
            children: [
              Text(
                personalAcc,
                style: AppFonts.s16w700.copyWith(
                    color: AppColors.lightGrey),
              ),
              const SizedBox(
                width: 10,
              ),
              Icon(
                Icons.copy_sharp,
                color: AppColors.lightGrey,
              )
            ],
          )),
    );
  }
}

