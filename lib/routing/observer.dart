import 'package:flutter/material.dart';

import '../utils/logger.dart';

/// Наблюдатель за маршрутами навигации
/// https://medium.com/@sumit.ghoshqa/understanding-routeobserver-in-flutter-309ce2997c27
///
class GoRouterObserver extends NavigatorObserver {
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPush(route, previousRoute);
    String p = '';
    if (route.settings.arguments != null) {
      // final obj = route.settings.arguments;
      // final String jsonString = jsonEncode(obj);
      // logd('** didPush argiments: ${jsonString}');
      // final List<int> bytes = utf8.encode(jsonString);
      // final jsonString2 = utf8.decode(bytes);
      // final obj2 = jsonDecode(jsonString2);

      final param = route.settings.arguments as Map<String, dynamic>;
      if (param.isNotEmpty) {
        p = '(${param.keys.join(',')})';
      }
    }
    final name =
        route.settings.name != null ? '${route.settings.name}$p' : '??';
    logd('*** didPush. ${previousRoute?.settings.name ?? '?'}->$name');
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
    logd(
        '*** didReplace. ${oldRoute?.settings.name ?? '?'}->${newRoute?.settings.name ?? '??'}');
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPop(route, previousRoute);
    logd(
        '*** didPop. ${previousRoute?.settings.name ?? '?'}->${route.settings.name ?? '??'}');
  }

  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didRemove(route, previousRoute);
    logd(
        '*** didRemove. ${previousRoute?.settings.name ?? '?'}->${route.settings.name ?? '??'}');
  }

  @override
  void didStartUserGesture(
      Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didStartUserGesture(route, previousRoute);
    logd(
        '*** didStartUserGesture. ${previousRoute?.settings.name ?? '?'}->${route.settings.name ?? '??'}');
  }

  @override
  void didStopUserGesture() {
    super.didStopUserGesture();
    logd('*** didStopUserGesture');
  }
}
