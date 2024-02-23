import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:skynet/core/config/router/app_router.gr.dart';
import 'package:skynet/core/config/themes/app_colors.dart';
import 'package:skynet/core/config/themes/app_fonts.dart';

@RoutePage()
class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});
  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: const [MainRoute(), NewsRoute()],
      transitionBuilder: (context, child, animation) => FadeTransition(
        opacity: animation,
        child: child,
      ),
      builder: (context, child) {
        // obtain the scoped TabsRouter controller using context
        final tabsRouter = AutoTabsRouter.of(context);
        // Here we're building our Scaffold inside of AutoTabsRouter
        // to access the tabsRouter controller provided in this context
        //
        //alterntivly you could use a global key
        return Scaffold(
            body: child,
            bottomNavigationBar: BottomNavigationBar(
              backgroundColor: AppColors.scaffoldBgColor,
              selectedLabelStyle: AppFonts.s12w700,
              selectedItemColor: AppColors.circleColor,
              unselectedItemColor: AppColors.lightGrey,
              unselectedIconTheme: IconThemeData(color: AppColors.lightGrey),
              currentIndex: tabsRouter.activeIndex,
              onTap: (index) {
                tabsRouter.setActiveIndex(index);
              },
              items: [
                BottomNavigationBarItem(
                  label: 'Главная',
                  icon: ShaderMask(
                    blendMode: BlendMode.srcIn,
                    shaderCallback: (Rect bounds) => const RadialGradient(
                      center: Alignment.topCenter,
                      stops: [.5, 1],
                      colors: AppColors.gradientColor,
                    ).createShader(bounds),
                    child: const Icon(
                      Icons.home_filled,
                      size: 33,
                    ),
                  ),
                ),
                BottomNavigationBarItem(
                  label: 'Новости',
                  icon: ShaderMask(
                    blendMode: BlendMode.srcIn,
                    shaderCallback: (Rect bounds) => const RadialGradient(
                      center: Alignment.topCenter,
                      stops: [.5, 1],
                      colors: AppColors.gradientColor,
                    ).createShader(bounds),
                    child: const Icon(
                      Icons.edit_document,
                      size: 33,
                    ),
                  ),
                ),
              ],
            ));
      },
    );
  }
}
