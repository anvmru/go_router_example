import 'package:flutter/material.dart';

import 'example2/custom_navigation_helper.dart';
import 'example2/main2.dart';

// void main() => runApp(const MyApp());
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return ProviderScope(
//       observers: [if (kDebugMode) LoggerRiverPod()],
//       child: ScreenUtilInit(
//           designSize: const Size(375.0, 812.0),
//           minTextAdapt: true,
//           splitScreenMode: true,
//           builder: (context, child) {
//             return MaterialApp.router(
//               title: 'Flutter Demo',
//               theme: ThemeData(primarySwatch: Colors.blue),
//               routerConfig: AppRouter.router,
//             );
//           }),
//     );
//   }
// }

void main() {
  CustomNavigationHelper.instance;
  runApp(const MyApp2());
}
