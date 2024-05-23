import 'package:dristi/l10n/localizations.dart';
import 'package:dristi/src/core/constants/app_values.dart';
import 'package:dristi/src/core/routes/app_router.dart';
import 'package:dristi/src/core/routes/app_routes.dart';
import 'package:dristi/src/core/styles/themes/app_theme.dart';
import 'package:dristi/src/core/utils/localization_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class App extends StatelessWidget {
  const App({
    Key? key,
    required this.isFirstTime,
  }) : super(key: key);

  final bool isFirstTime;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize:
          const Size(AppValues.dimenDefaultWidth, AppValues.dimenDefaultHeight),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          initialRoute: isFirstTime ? AppRoutes.splash : AppRoutes.home,
          onGenerateRoute: RouteGenerator.generateRoute,
          navigatorKey: navigatorKey,
          debugShowCheckedModeBanner: false,
          theme: AppThemeData.darkTheme,
          darkTheme: AppThemeData.darkTheme,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: _supportedLocales,
          locale: AppLanguages.bn.toLocale,
        );
      },
    );
  }

  List<Locale> get _supportedLocales => AppLanguages.values
      .map((AppLanguages language) => language.toLocale)
      .toList();
}
