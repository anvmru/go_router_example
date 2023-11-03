import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoggerRiverPod extends ProviderObserver {
  @override
  void didUpdateProvider(
    ProviderBase provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) {
    if (kDebugMode) {
      print('''
{
  "Update provider": "${provider.name ?? provider.runtimeType}",
  "previousValue": "$previousValue"
  "newValue": "$newValue"
}''');
    }
  }

  @override
  void didDisposeProvider(ProviderBase provider, ProviderContainer containers) {
    if (kDebugMode) {
      print('''
{
  "Dispose provider": "${provider.name ?? provider.runtimeType}"
}''');
    }
  }

  @override
  void didAddProvider(
      ProviderBase provider, Object? value, ProviderContainer container) {
    if (kDebugMode) {
      print('''
{
  "Add provider": "${provider.name ?? provider.runtimeType}",
  "value": "$value"
}''');
    }
  }
}
