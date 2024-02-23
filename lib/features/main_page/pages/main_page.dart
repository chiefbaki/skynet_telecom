import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:skynet/core/config/themes/app_colors.dart';
import 'package:skynet/core/config/themes/app_fonts.dart';
import 'package:skynet/features/widgets/connected_service.dart';
import 'package:skynet/features/widgets/copy_btn.dart';
import 'package:skynet/features/widgets/custom_app_bar.dart';
import 'package:skynet/features/widgets/custom_btn.dart';
import 'package:skynet/features/widgets/history_btn.dart';
import 'package:skynet/features/widgets/home_cards.dart';
import 'package:skynet/features/widgets/pay_btn.dart';

@RoutePage()
class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 27),
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const HomeCards(),
                const SizedBox(
                  height: 16,
                ),
                Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.42,
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 22, vertical: 35),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Column(
                              children: [
                                Text(
                                  "Лицевой счет:",
                                  style: AppFonts.s22w700,
                                ),
                                CopyBtn(),
                              ],
                            ),
                            SizedBox(
                              height: 70,
                              child: Column(
                                children: [
                                  Text(
                                    "Баланс:",
                                    style: AppFonts.s22w700
                                        .copyWith(color: AppColors.green),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "1200 c",
                                    style: AppFonts.s22w900
                                        .copyWith(color: AppColors.green),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        const HistoryBtn(),
                        const SizedBox(
                          height: 16,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomBtn(
                              onTap: () {},
                              title: "Доверительный\nплатеж",
                              text: "Доступно 3 дня",
                              icon: Icons.handshake,
                            ),
                            CustomBtn(
                              onTap: () {},
                              title: "Чат с\nтехподдержкой",
                              text: "Онлайн 24/7",
                              icon: Icons.headphones_outlined,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        const PayBtn()
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Подключенные услуги: ",
                  style: AppFonts.s25w700,
                ),
                const SizedBox(
                  height: 10,
                ),
                const ConnectedServices()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

