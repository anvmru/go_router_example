import 'package:flutter/material.dart';

import 'custom_navigation_helper.dart';

// void main() {
//   CustomNavigationHelper.instance;
//   runApp(const MyApp());
// }

/*
https://gist.github.com/onatcipli/aed0372c987b4ae32311fe32bb4c1209
*/

class MyApp2 extends StatelessWidget {
  const MyApp2({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: CustomNavigationHelper.router,
    );
  }
}
