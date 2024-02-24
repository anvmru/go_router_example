import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_example/example2/search_page.dart';
import 'package:go_router_example/example2/setting_page.dart';
import 'package:go_router_example/example2/sign_in_page.dart';
import 'package:go_router_example/example2/sign_up_page.dart';

import 'bottom_navigation_page.dart';
import 'detail_page.dart';
import 'home_page.dart';

class CustomNavigationHelper {
  static final CustomNavigationHelper _instance =
      CustomNavigationHelper._internal();

  static CustomNavigationHelper get instance => _instance;

  static late final GoRouter router;

  static final parentNavigatorKey = GlobalKey<NavigatorState>();
  static final homeTabNavigatorKey = GlobalKey<NavigatorState>();
  static final searchTabNavigatorKey = GlobalKey<NavigatorState>();
  static final settingsTabNavigatorKey = GlobalKey<NavigatorState>();

  BuildContext get context =>
      router.routerDelegate.navigatorKey.currentContext!;

  GoRouterDelegate get routerDelegate => router.routerDelegate;

  GoRouteInformationParser get routeInformationParser =>
      router.routeInformationParser;

  static const String signUpPath = '/signUp';
  static const String signInPath = '/signIn';
  static const String detailPath = '/detail';
  static const String rootDetailPath = '/rootDetail';

  static const String homePath = '/home';
  static const String settingsPath = '/settings';
  static const String searchPath = '/search';

  factory CustomNavigationHelper() => _instance;

  CustomNavigationHelper._internal() {
    final routes = [
      StatefulShellRoute.indexedStack(
        parentNavigatorKey: parentNavigatorKey,
        branches: [
          StatefulShellBranch(
            navigatorKey: homeTabNavigatorKey,
            routes: [
              GoRoute(
                path: homePath,
                pageBuilder: (context, GoRouterState state) =>
                    getPage(child: const HomePage(), state: state),
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: searchTabNavigatorKey,
            routes: [
              GoRoute(
                path: searchPath,
                pageBuilder: (context, state) =>
                    getPage(child: const SearchPage(), state: state),
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: settingsTabNavigatorKey,
            routes: [
              GoRoute(
                path: settingsPath,
                pageBuilder: (context, state) =>
                    getPage(child: const SettingsPage(), state: state),
              ),
            ],
          ),
        ],
        pageBuilder: (
          BuildContext context,
          GoRouterState state,
          StatefulNavigationShell navigationShell,
        ) {
          return getPage(
            child: BottomNavigationPage(child: navigationShell),
            state: state,
          );
        },
      ),
      GoRoute(
        parentNavigatorKey: parentNavigatorKey,
        path: signUpPath,
        pageBuilder: (context, state) =>
            getPage(child: const SignUpPage(), state: state),
      ),
      GoRoute(
        parentNavigatorKey: parentNavigatorKey,
        path: signInPath,
        pageBuilder: (context, state) =>
            getPage(child: const SignInPage(), state: state),
      ),
      GoRoute(
        path: detailPath,
        pageBuilder: (context, state) =>
            getPage(child: const DetailPage(), state: state),
      ),
      GoRoute(
        parentNavigatorKey: parentNavigatorKey,
        path: rootDetailPath,
        pageBuilder: (context, state) =>
            getPage(child: const DetailPage(), state: state),
      ),
    ];

    router = GoRouter(
        navigatorKey: parentNavigatorKey,
        initialLocation: signUpPath,
        routes: routes);
  }

  static Page getPage({required Widget child, required GoRouterState state}) {
    return MaterialPage(key: state.pageKey, child: child);
  }
}
