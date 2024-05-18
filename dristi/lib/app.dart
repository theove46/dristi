import 'package:dristi/l10n/localizations.dart';
import 'package:dristi/src/core/constants/app_values.dart';
import 'package:dristi/src/core/services/routes/app_router.dart';
import 'package:dristi/src/core/theme/colors.dart';
import 'package:dristi/src/core/theme/text_styles.dart';
import 'package:dristi/src/core/utils/localization_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
        return MaterialApp.router(
          // routerConfig: appRouter,
          routerConfig: appRouter(isFirstTime),
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            appBarTheme: AppBarTheme(
              backgroundColor: UIColors.white,
              elevation: 0,
              titleSpacing: 0,
              centerTitle: true,
              titleTextStyle: blackNovaBold18,
              iconTheme: const IconThemeData(
                color: UIColors.black,
              ),
            ),
          ),
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
