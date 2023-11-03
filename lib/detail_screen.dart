import 'package:flutter/material.dart';
import 'person_model.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key, required this.person});
  final PersonModel person;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Person')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[Text('P: ${person.toString()}')],
          ),
        ));
  }
}
