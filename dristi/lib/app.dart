import 'package:dristi/l10n/localizations.dart';
import 'package:dristi/src/core/base/base_consumer_stateful_widget.dart';
import 'package:dristi/src/core/constants/app_values.dart';
import 'package:dristi/src/core/routes/app_router.dart';
import 'package:dristi/src/core/utils/localization_ext.dart';
import 'package:dristi/src/features/drawer/presentation/riverpod/drawer_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class App extends ConsumerStatefulWidget {
  const App({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<App> createState() => _AppState();
}

class _AppState extends BaseConsumerStatefulWidget<App> {
  @override
  Widget build(BuildContext context) {
    final languageState = ref.watch(languageProvider).toLanguage;
    final themeState = ref.watch(themeProvider);

    return ScreenUtilInit(
      designSize:
          const Size(AppValues.dimenDefaultWidth, AppValues.dimenDefaultHeight),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp.router(
          routerConfig: appRouter,
          debugShowCheckedModeBanner: false,
          theme: getLightThemeData(themeState),
          darkTheme: getDarkThemeData(themeState),
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: _supportedLanguages,
          locale: languageState,
        );
      },
    );
  }

  List<Locale> get _supportedLanguages => AppLanguages.values
      .map((AppLanguages language) => language.toLanguage)
      .toList();
}
