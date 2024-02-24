import 'package:flutter/material.dart';
import 'package:skynet/core/config/themes/app_colors.dart';
import 'package:skynet/core/config/themes/app_fonts.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String name;
  final String address;
  const CustomAppBar({super.key, required this.name, required this.address});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: const [
        Padding(
          padding: EdgeInsets.only(right: 27),
          child: CircleAvatar(
            radius: 15,
            backgroundColor: AppColors.circleColor,
          ),
        ),
      ],
      title: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: AppFonts.s22w700.copyWith(color: AppColors.black),
                  ),
                  SizedBox(
                    width: 240,
                    child: Text(
                      address,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      style:
                          AppFonts.s12w700.copyWith(color: AppColors.lightGrey),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(40);
}
