import 'package:flutter/material.dart';
import 'package:skynet/core/config/router/app_router.dart';


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter().config(),
    );
  }
}