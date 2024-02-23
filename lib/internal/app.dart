import 'package:flutter/material.dart';
import 'package:skynet/core/config/router/app_router.dart';
import 'package:skynet/core/config/themes/app_colors.dart';


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: false,
        scaffoldBackgroundColor: AppColors.scaffoldBgColor
      ),
      routerConfig: AppRouter().config(),
    );
  }
}