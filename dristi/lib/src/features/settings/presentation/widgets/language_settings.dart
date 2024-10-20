import 'package:dristi/src/core/base/base_consumer_stateful_widget.dart';
import 'package:dristi/src/core/constants/app_assets.dart';
import 'package:dristi/src/core/global_providers/language_settings/language_settings_provider.dart';
import 'package:dristi/src/core/utils/enums.dart';
import 'package:dristi/src/core/utils/localization_ext.dart';
import 'package:dristi/src/features/settings/presentation/widgets/settings_bottom_sheet.dart';
import 'package:dristi/src/features/settings/presentation/widgets/settings_item.dart';
import 'package:dristi/src/features/settings/presentation/widgets/sheet_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LanguageSettings extends ConsumerStatefulWidget {
  const LanguageSettings({super.key});

  @override
  ConsumerState createState() => _LanguageSettingsState();
}

class _LanguageSettingsState
    extends BaseConsumerStatefulWidget<LanguageSettings> {
  @override
  Widget build(BuildContext context) {
    final languageState = ref.watch(languageProvider);

    return SettingsItems(
      icon: Assets.language,
      title: context.localization.language,
      subTitle: _getLanguageText(languageState.language),
      onTap: () {
        _showSelectionBottomSheet(
          title: context.localization.language,
          items: [
            SheetItem(
              title: context.localization.english,
              value: AppLanguages.en,
            ),
            SheetItem(
              title: context.localization.bengali,
              value: AppLanguages.bn,
            ),
          ],
          selectedItem: languageState.language,
          onItemSelected: (value) {
            ref.read(languageProvider.notifier).setLanguage(value);
          },
        );
      },
    );
  }

  String _getLanguageText(AppLanguages language) {
    switch (language) {
      case AppLanguages.en:
        return context.localization.english;
      case AppLanguages.bn:
        return context.localization.bengali;
      default:
        return '';
    }
  }

  void _showSelectionBottomSheet<T>({
    required String title,
    required List<SheetItem<T>> items,
    required T selectedItem,
    required Function(dynamic) onItemSelected,
  }) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return SettingsBottomSheet(
          title: title,
          items: items,
          selectedItem: selectedItem,
          onItemSelected: onItemSelected,
        );
      },
    );
  }
}
