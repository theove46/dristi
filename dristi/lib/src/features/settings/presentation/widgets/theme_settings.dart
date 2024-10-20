import 'package:dristi/src/core/base/base_consumer_stateful_widget.dart';
import 'package:dristi/src/core/constants/app_assets.dart';
import 'package:dristi/src/core/global_providers/theme_settings/theme_settings_provider.dart';
import 'package:dristi/src/core/utils/enums.dart';
import 'package:dristi/src/core/utils/localization_ext.dart';
import 'package:dristi/src/features/settings/presentation/widgets/settings_bottom_sheet.dart';
import 'package:dristi/src/features/settings/presentation/widgets/settings_item.dart';
import 'package:dristi/src/features/settings/presentation/widgets/sheet_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ThemeSettings extends ConsumerStatefulWidget {
  const ThemeSettings({super.key});

  @override
  ConsumerState createState() => _ThemeSettingsState();
}

class _ThemeSettingsState extends BaseConsumerStatefulWidget<ThemeSettings> {
  @override
  Widget build(BuildContext context) {
    final themeState = ref.watch(themeProvider);

    return SettingsItems(
      icon: Assets.theme,
      title: context.localization.theme,
      subTitle: _getThemeText(themeState.theme),
      onTap: () {
        _showSelectionBottomSheet(
          title: context.localization.theme,
          items: [
            SheetItem(
              title: context.localization.systemDefault,
              value: AppTheme.systemDefault,
            ),
            SheetItem(
              title: context.localization.light,
              value: AppTheme.light,
            ),
            SheetItem(
              title: context.localization.dark,
              value: AppTheme.dark,
            ),
          ],
          selectedItem: themeState.theme,
          onItemSelected: (value) {
            ref.read(themeProvider.notifier).setTheme(value);
          },
        );
      },
    );
  }

  String _getThemeText(AppTheme theme) {
    switch (theme) {
      case AppTheme.systemDefault:
        return context.localization.systemDefault;
      case AppTheme.light:
        return context.localization.light;
      case AppTheme.dark:
        return context.localization.dark;
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
