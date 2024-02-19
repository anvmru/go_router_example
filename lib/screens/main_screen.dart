import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../data/person_model.dart';
import '../routing/app_router.dart';
import 'dialog_screen.dart';
import 'provider_screen.dart';

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
    final buttonStyle = ButtonStyle(
      alignment: Alignment.center,
      fixedSize: MaterialStatePropertyAll<Size>(Size.fromWidth(1.sw * 0.75)),
    );
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            OutlinedButton(
                style: buttonStyle,
                onPressed: () => context.push(AppRouter.details, extra: p1),
                child: Text('push: ${p1.toString()}')),
            const SizedBox(height: 20),
            OutlinedButton(
              style: buttonStyle,
              onPressed: () => ProviderScreen.go(context, p2),
              child: Text('provider.go: ${p2.toString()}'),
            ),
            const SizedBox(height: 20),
            OutlinedButton(
              style: buttonStyle,
              onPressed: () => DialogScreen.go(context, p3),
              child: Text('dialog.go: ${p3.toString()}'),
            ),
            const SizedBox(height: 20),
            OutlinedButton(
              style: buttonStyle,
              onPressed: () =>
                  context.go('/${DialogScreen.path}', extra: {'person': p1}),
              child: Text('goRouter.go: ${p1.toString()}'),
            ),
            //const ShimmerArrows(),
          ],
        ),
      ),
    );
  }
}
