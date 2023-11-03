import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'dialog_screen.dart';
import 'person_model.dart';
import 'provider_screen.dart';
import 'app_router.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key, required this.title});
  final String title;

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    final p1 = PersonModel('Anton', age: 28);
    final p2 = PersonModel('Tim', age: 26);
    final p3 = PersonModel('Liliya', age: 24);
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            GestureDetector(
              child: Text('Person1: ${p1.toString()}'),
              onTap: () => context.push(AppRouter.details, extra: p1),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              child: Text('Person2: ${p2.toString()}'),
              // onTap: () => context.push(ProviderScreen.path, extra: p2),
              onTap: () => ProviderScreen.go(context, p2),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              child: Text('Person3: ${p3.toString()}'),
              onTap: () => DialogScreen.go(context, p3),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              child: Text('Person3 per GoRouter: ${p1.toString()}'),
              onTap: () =>
                  context.go('/${DialogScreen.path}', extra: {'person': p1}),
            ),
          ],
        ),
      ),
    );
  }
}
