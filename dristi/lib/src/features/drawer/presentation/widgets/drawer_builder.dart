import 'package:dristi/l10n/localizations.dart';
import 'package:dristi/src/core/base/base_consumer_stateful_widget.dart';
import 'package:dristi/src/core/utils/localization_ext.dart';
import 'package:dristi/src/features/drawer/presentation/riverpod/drawer_provider.dart';
import 'package:flutter/material.dart';
import 'package:dristi/src/core/constants/app_assets.dart';
import 'package:dristi/src/core/constants/app_values.dart';
import 'package:dristi/src/core/utils/asset_image_view.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DrawerBuilder extends ConsumerStatefulWidget {
  const DrawerBuilder({Key? key}) : super(key: key);

  @override
  ConsumerState createState() => _DrawerBuilderState();
}

class _DrawerBuilderState extends BaseConsumerStatefulWidget<DrawerBuilder> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.all(AppValues.dimen_8.r),
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: AppValues.dimen_60.r,
              bottom: AppValues.dimen_10.r,
              left: AppValues.dimen_16.r,
            ),
            child: Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  padding: EdgeInsets.all(AppValues.dimen_2.r),
                  decoration: BoxDecoration(
                    color: uiColors.onImage,
                    shape: BoxShape.circle,
                  ),
                  child: ClipOval(
                    child: SizedBox.fromSize(
                      size: Size.fromRadius(AppValues.dimen_40.r),
                      child: const AssetImageView(
                        fileName: Assets.logo,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                )),
          ),
          _buildExpansionTile(
            title: context.localization.theme,
            children: [
              _buildThemeButton(
                context.localization.systemDefault,
                AppTheme.systemDefault,
              ),
              _buildThemeButton(
                context.localization.light,
                AppTheme.light,
              ),
              _buildThemeButton(
                context.localization.dark,
                AppTheme.dark,
              ),
            ],
          ),
          _buildExpansionTile(
            title: context.localization.language,
            children: [
              _buildLanguageButton(
                context.localization.english,
                AppLanguages.en,
              ),
              _buildLanguageButton(
                context.localization.bengali,
                AppLanguages.bn,
              ),
            ],
          ),
          ListTile(
            title: Text(
              context.localization.favouritePlaces,
              style: appTextStyles.secondaryNovaRegular16,
            ),
            trailing: Padding(
              padding: EdgeInsets.only(right: AppValues.dimen_2.w),
              child: Icon(
                Icons.favorite_border_outlined,
                color: uiColors.primary,
                size: AppValues.dimen_20.sp,
              ),
            ),
            onTap: () {},
          ),
          ListTile(
            title: Text(
              context.localization.contactUs,
              style: appTextStyles.secondaryNovaRegular16,
            ),
            trailing: Padding(
              padding: EdgeInsets.only(right: AppValues.dimen_2.w),
              child: Icon(
                Icons.contact_mail_outlined,
                color: uiColors.primary,
                size: AppValues.dimen_20.sp,
              ),
            ),
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildExpansionTile({
    required String title,
    required List<Widget> children,
  }) {
    return ExpansionTile(
      title: Text(
        title,
        style: appTextStyles.secondaryNovaRegular16,
      ),
      shape: const Border(),
      collapsedIconColor: uiColors.primary,
      children: children,
    );
  }

  Widget _buildThemeButton(
    String text,
    AppTheme value,
  ) {
    final selectedThemeState = ref.watch(themeProvider);
    final selectedThemeNotifier = ref.read(themeProvider.notifier);

    return ListTile(
      title: Text(
        text,
        style: appTextStyles.secondaryNovaRegular12,
      ),
      trailing: Radio<AppTheme>(
        value: value,
        groupValue: selectedThemeState,
        onChanged: (val) {
          selectedThemeNotifier.state = val!;
        },
        activeColor: uiColors.primary,
        fillColor: WidgetStateColor.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return uiColors.primary;
          }
          return uiColors.primary;
        }),
      ),
    );
  }

  Widget _buildLanguageButton(
    String text,
    AppLanguages value,
  ) {
    final selectedLanguageState = ref.watch(languageProvider);
    final selectedLanguageNotifier = ref.read(languageProvider.notifier);

    return ListTile(
      title: Text(
        text,
        style: appTextStyles.secondaryNovaRegular12,
      ),
      trailing: Radio<AppLanguages>(
        value: value,
        groupValue: selectedLanguageState,
        onChanged: (val) {
          selectedLanguageNotifier.state = val!;
        },
        activeColor: uiColors.primary,
        fillColor: WidgetStateColor.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return uiColors.primary;
          }
          return uiColors.primary;
        }),
      ),
    );
  }
}
