import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skynet/core/config/router/app_router.dart';
import 'package:skynet/core/config/themes/app_colors.dart';
import 'package:skynet/features/main_page/domain/balance_repository_imp.dart';
import 'package:skynet/features/main_page/domain/balance_repository_usecase.dart';
import 'package:skynet/features/main_page/presentation/bloc/client_info/client_info_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => BalanceRepositoryUseCase(),
        ),
        RepositoryProvider(
          create: (context) => BalanceRepositoryImpl(
              balanceRepUseCase:
                  RepositoryProvider.of<BalanceRepositoryUseCase>(context)),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => ClientInfoBloc(
                repository:
                    RepositoryProvider.of<BalanceRepositoryImpl>(context)),
          ),
          // BlocProvider(
          //   create: (context) => SubjectBloc(),
          // ),
        ],
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              useMaterial3: false,
              scaffoldBackgroundColor: AppColors.scaffoldBgColor,
              appBarTheme: const AppBarTheme(
                  color: AppColors.scaffoldBgColor, elevation: 0)),
          routerConfig: AppRouter().config(),
        ),
      ),
    );
  }
}
