import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'dialog_screen.dart';
import '../data/person_model.dart';

final personProvider =
    Provider.autoDispose<PersonModel?>((ref) => null, name: 'personProvider');

class ProviderScreen extends ConsumerWidget {
  const ProviderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final person = ref.watch(personProvider);
    return Scaffold(
        appBar: AppBar(title: const Text('Person Provider')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('PP: ${person.toString()}'),
              if (person != null)
                GestureDetector(
                  child: Text('Person2 ${person.toString()}'),
                  onTap: () => DialogScreen.go(context, person),
                ),
            ],
          ),
        ));
  }

  /// роут
  static const path = '/personProvider';

  /// билдер
  static Page pageBuilder(BuildContext context, GoRouterState state) {
    final param = state.extra as Map<String, Object>;
    final person = param['person'] as PersonModel;
    return MaterialPage(
      name: path,
      arguments: param,
      child: ProviderScope(
          overrides: [personProvider.overrideWithValue(person)],
          child: const ProviderScreen()),
    );
  }

  /// type-safe вызов
  static go(BuildContext context, PersonModel person) =>
      GoRouter.of(context).push(path, extra: {'person': person});
}
