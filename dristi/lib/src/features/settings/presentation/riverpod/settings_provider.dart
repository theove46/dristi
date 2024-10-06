import 'package:dristi/src/features/settings/presentation/riverpod/settings_notifier.dart';
import 'package:dristi/src/features/settings/presentation/riverpod/settings_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final settingsProvider = NotifierProvider<SettingsNotifier, SettingsState>(
  SettingsNotifier.new,
  name: 'settingsProvider',
);
