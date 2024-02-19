import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../screens/detail_screen.dart';
import '../screens/dialog_screen.dart';
import '../screens/main_screen.dart';
import 'observer.dart';
import '../data/person_model.dart';
import '../screens/provider_screen.dart';

class AppRouter {
  static GoRouter get router => _router;

  static const root = '/';
  static const details = '/details';

  static Widget _mainRouteBuilder(BuildContext context, GoRouterState state) =>
      const MainScreen(title: 'MainScreen');
  static Widget _detailsRouteBuilder(
          BuildContext context, GoRouterState state) =>
      DetailScreen(person: state.extra as PersonModel);

  static final GoRouter _router = GoRouter(
    observers: [GoRouterObserver()],
    routes: <GoRoute>[
      GoRoute(path: root, builder: _mainRouteBuilder, routes: [
        GoRoute(path: DialogScreen.path, pageBuilder: DialogScreen.pageBuilder),
      ]),
      GoRoute(path: details, builder: _detailsRouteBuilder),
      GoRoute(
          path: ProviderScreen.path, pageBuilder: ProviderScreen.pageBuilder),
    ],
    // errorBuilder: errorWidget,
  );
}
