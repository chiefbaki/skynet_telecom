import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:skynet/features/widgets/custom_app_bar.dart';

@RoutePage()
class NewsPage extends StatelessWidget {
  const NewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Center(
        child: Column(
          children: [
            Text("new")
          ],
        ),
      ),
    );
  }
}