import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:skynet/core/config/router/app_router.gr.dart';
import 'package:skynet/core/config/themes/app_colors.dart';
import 'package:skynet/core/config/themes/app_fonts.dart';
import 'package:skynet/core/utils/resources/resources.dart';

class NewsContainer extends StatelessWidget {
  final String title;
  final String text;
  final String img;
  const NewsContainer(
      {super.key, required this.img, required this.text, required this.title});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.router.push(NewsInfoRoute(text: text, title: title));
      },
      child: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.11,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: AppColors.lightGrey,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Image.asset(
                  Images.imgNews,
                  width: 40,
                  height: 40,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                      width: 240,
                      child: Text(
                        title,
                        style: AppFonts.s16w700,
                        overflow: TextOverflow.ellipsis,
                        softWrap: true,
                      )),
                  SizedBox(
                      width: 200,
                      child: Text(
                        text,
                        style: AppFonts.s12w400
                            .copyWith(color: AppColors.lightGrey),
                        overflow: TextOverflow.ellipsis,
                        softWrap: true,
                      )),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
