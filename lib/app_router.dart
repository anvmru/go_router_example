import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'detail_screen.dart';
import 'dialog_screen.dart';
import 'main_screen.dart';
import 'observer.dart';
import 'person_model.dart';
import 'provider_screen.dart';

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
