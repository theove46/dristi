import 'package:dristi/src/core/base/base_consumer_stateful_widget.dart';
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
              right: AppValues.dimen_16.r,
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
            title: 'Theme',
            children: [
              _buildThemeButton('Default', 'theme', 'default'),
              _buildThemeButton('Light', 'theme', 'light'),
              _buildThemeButton('Dark', 'theme', 'dark'),
            ],
          ),
          _buildExpansionTile(
            title: 'Language',
            children: [
              _buildLanguageButton('English', 'language', 'en'),
              _buildLanguageButton('Bengali', 'language', 'bn'),
            ],
          ),
          ListTile(
            title: Text(
              'Favourite places',
              style: appTextStyles.secondaryNovaSemiBold16,
            ),
            trailing: Icon(
              Icons.favorite_border,
              color: uiColors.primary,
              size: AppValues.dimen_20.sp,
            ),
            onTap: () {},
          ),
          ListTile(
            title: Text(
              'Contact us',
              style: appTextStyles.secondaryNovaSemiBold16,
            ),
            trailing: Icon(
              Icons.info_outlined,
              color: uiColors.primary,
              size: AppValues.dimen_20.sp,
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
        style: appTextStyles.secondaryNovaSemiBold16,
      ),
      shape: const Border(),
      collapsedIconColor: uiColors.primary,
      children: children,
    );
  }

  Widget _buildThemeButton(
    String text,
    String groupValue,
    String value,
  ) {
    final selectedThemeState = ref.watch(themeProvider);
    final selectedThemeNotifier = ref.read(themeProvider.notifier);

    return ListTile(
      title: Text(
        text,
        style: appTextStyles.secondaryNovaSemiBold12,
      ),
      trailing: Radio<String>(
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
    String groupValue,
    String value,
  ) {
    final selectedLanguageState = ref.watch(languageProvider);
    final selectedLanguageNotifier = ref.read(languageProvider.notifier);

    return ListTile(
      title: Text(
        text,
        style: appTextStyles.secondaryNovaSemiBold12,
      ),
      trailing: Radio<String>(
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
