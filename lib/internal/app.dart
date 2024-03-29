import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skynet/core/config/dio_settings/dio_settings.dart';
import 'package:skynet/core/config/router/app_router.dart';
import 'package:skynet/core/config/themes/app_colors.dart';
import 'package:skynet/features/main_page/domain/balance_repository_imp.dart';
import 'package:skynet/features/main_page/domain/balance_repository_usecase.dart';
import 'package:skynet/features/main_page/domain/personal_repository_imp.dart';
import 'package:skynet/features/main_page/domain/personal_repository_usecase.dart';
import 'package:skynet/features/main_page/domain/transations_repository_imp.dart';
import 'package:skynet/features/main_page/domain/transations_repository_usecase.dart';
import 'package:skynet/features/main_page/presentation/bloc/client_info/client_info_bloc.dart';
import 'package:skynet/features/main_page/presentation/bloc/personal_news/personal_news_bloc.dart';
import 'package:skynet/features/main_page/presentation/bloc/transactions/bloc/transactions_bloc.dart';
import 'package:skynet/features/news_page/domain/news_repository_imp.dart';
import 'package:skynet/features/news_page/domain/news_repository_usecase.dart';
import 'package:skynet/features/news_page/presentation/bloc/bloc/news_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (context) => DioSettings()),
        RepositoryProvider(
          create: (context) => BalanceRepositoryUseCase(
              dio: RepositoryProvider.of<DioSettings>(context).dio),
        ),
        RepositoryProvider(
          create: (context) => BalanceRepositoryImpl(
              balanceRepUseCase:
                  RepositoryProvider.of<BalanceRepositoryUseCase>(context)),
        ),
        RepositoryProvider(
          create: (context) => PersonalNewsUseCase(
              dio: RepositoryProvider.of<DioSettings>(context).dio),
        ),
        RepositoryProvider(
          create: (context) => PersonalNewsRepositoryImpl(
              useCase: RepositoryProvider.of<PersonalNewsUseCase>(context)),
        ),
        RepositoryProvider(
          create: (context) => TransactionsRepositoryUseCase(
              dio: RepositoryProvider.of<DioSettings>(context).dio),
        ),
        RepositoryProvider(
          create: (context) => TransactionsRepositoryImpl(
              useCase: RepositoryProvider.of<TransactionsRepositoryUseCase>(
                  context)),
        ),
        RepositoryProvider(
          create: (context) => NewsRepositoryUseCase(
              dio: RepositoryProvider.of<DioSettings>(context).dio),
        ),
        RepositoryProvider(
          create: (context) => NewsRepositoryImpl(
              useCase: RepositoryProvider.of<NewsRepositoryUseCase>(
                  context)),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => ClientInfoBloc(
                repository:
                    RepositoryProvider.of<BalanceRepositoryImpl>(context)),
          ),
          BlocProvider(
            create: (context) => PersonalNewsBloc(
                repository:
                    RepositoryProvider.of<PersonalNewsRepositoryImpl>(context)),
          ),
          BlocProvider(
            create: (context) => TransactionsBloc(
                repository:
                    RepositoryProvider.of<TransactionsRepositoryImpl>(context)),
          ),
          BlocProvider(
            create: (context) => NewsBloc(
                repository:
                    RepositoryProvider.of<NewsRepositoryImpl>(context)),
          ),
        ],
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              useMaterial3: false,
              progressIndicatorTheme: const ProgressIndicatorThemeData(
                circularTrackColor: AppColors.circleColor,
              ),
              scaffoldBackgroundColor: AppColors.scaffoldBgColor,
              appBarTheme: const AppBarTheme(
                  color: AppColors.scaffoldBgColor, elevation: 0)),
          routerConfig: AppRouter().config(),
        ),
      ),
    );
  }
}
