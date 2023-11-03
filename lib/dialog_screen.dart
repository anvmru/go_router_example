import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'app_dialog_page.dart';
import 'person_model.dart';

final personProvider =
    Provider.autoDispose<PersonModel?>((ref) => null, name: 'personProvider');

class DialogScreen extends ConsumerWidget {
  const DialogScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final person = ref.watch(personProvider);
    return Scaffold(
        appBar: AppBar(title: const Text('Dialog')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[Text('PPP: ${person.toString()}')],
          ),
        ));
  }

  /// роут
  static const path = 'dialog';

  /// type-safe вызов
  static Future<PersonModel?> go(
      BuildContext context, PersonModel person) async {
    final container = ProviderScope.containerOf(context);
    return await showMaterialModalBottomSheet<PersonModel?>(
      settings: RouteSettings(
        name: path,
        arguments: {'person': person},
      ),
      context: context,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      builder: (context) => SizedBox(
          height: 400,
          child: ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(20)),
              child: ProviderScope(
                parent: container,
                overrides: [personProvider.overrideWithValue(person)],
                child: const DialogScreen(),
              ))),
    );
  }

  /// билдер
  static Page pageBuilder(BuildContext context, GoRouterState state) {
    final param = state.extra as Map<String, Object>;
    final person = param['person'] as PersonModel;
    final container = ProviderScope.containerOf(context);
    return AppDialogPage(
      settings: RouteSettings(name: path, arguments: param),
      builder: (context) => Container(
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
        child: SizedBox(
            height: 400,
            child: ClipRRect(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(20)),
                child: ProviderScope(
                  parent: container,
                  overrides: [personProvider.overrideWithValue(person)],
                  child: const DialogScreen(),
                ))),
      ),
    );
  }
}
