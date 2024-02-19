import 'package:flutter/material.dart';

class ScreenA extends StatelessWidget {
  const ScreenA({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Screen A')),
        body: Center(
          child: ListView(
            children: const <Widget>[
              Text('Test B'),
            ],
          ),
        ));
  }
}
