// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:flutter/material.dart' as _i7;
import 'package:skynet/features/main_page/presentation/pages/main_page.dart'
    as _i2;
import 'package:skynet/features/main_page/presentation/pages/transactions_page.dart'
    as _i5;
import 'package:skynet/features/news_page/presentation/pages/news_info_page.dart'
    as _i3;
import 'package:skynet/features/news_page/presentation/pages/news_page.dart'
    as _i4;
import 'package:skynet/features/widgets/bottom_nav.dart' as _i1;

abstract class $AppRouter extends _i6.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    DashboardRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.DashboardPage(),
      );
    },
    MainRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.MainPage(),
      );
    },
    NewsInfoRoute.name: (routeData) {
      final args = routeData.argsAs<NewsInfoRouteArgs>();
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.NewsInfoPage(
          key: args.key,
          text: args.text,
          title: args.title,
        ),
      );
    },
    NewsRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.NewsPage(),
      );
    },
    TransactionsRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.TransactionsPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.DashboardPage]
class DashboardRoute extends _i6.PageRouteInfo<void> {
  const DashboardRoute({List<_i6.PageRouteInfo>? children})
      : super(
          DashboardRoute.name,
          initialChildren: children,
        );

  static const String name = 'DashboardRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i2.MainPage]
class MainRoute extends _i6.PageRouteInfo<void> {
  const MainRoute({List<_i6.PageRouteInfo>? children})
      : super(
          MainRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i3.NewsInfoPage]
class NewsInfoRoute extends _i6.PageRouteInfo<NewsInfoRouteArgs> {
  NewsInfoRoute({
    _i7.Key? key,
    required String text,
    required String title,
    List<_i6.PageRouteInfo>? children,
  }) : super(
          NewsInfoRoute.name,
          args: NewsInfoRouteArgs(
            key: key,
            text: text,
            title: title,
          ),
          initialChildren: children,
        );

  static const String name = 'NewsInfoRoute';

  static const _i6.PageInfo<NewsInfoRouteArgs> page =
      _i6.PageInfo<NewsInfoRouteArgs>(name);
}

class NewsInfoRouteArgs {
  const NewsInfoRouteArgs({
    this.key,
    required this.text,
    required this.title,
  });

  final _i7.Key? key;

  final String text;

  final String title;

  @override
  String toString() {
    return 'NewsInfoRouteArgs{key: $key, text: $text, title: $title}';
  }
}

/// generated route for
/// [_i4.NewsPage]
class NewsRoute extends _i6.PageRouteInfo<void> {
  const NewsRoute({List<_i6.PageRouteInfo>? children})
      : super(
          NewsRoute.name,
          initialChildren: children,
        );

  static const String name = 'NewsRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i5.TransactionsPage]
class TransactionsRoute extends _i6.PageRouteInfo<void> {
  const TransactionsRoute({List<_i6.PageRouteInfo>? children})
      : super(
          TransactionsRoute.name,
          initialChildren: children,
        );

  static const String name = 'TransactionsRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}
