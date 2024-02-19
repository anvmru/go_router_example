import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'utils/logger_riverpod.dart';
import 'routing/app_router.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      observers: [if (kDebugMode) LoggerRiverPod()],
      child: ScreenUtilInit(
          designSize: const Size(375.0, 812.0),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) {
            return MaterialApp.router(
              title: 'Flutter Demo',
              theme: ThemeData(primarySwatch: Colors.blue),
              routerConfig: AppRouter.router,
            );
          }),
    );
  }
}
