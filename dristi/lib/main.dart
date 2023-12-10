import 'package:dristi/src/core/services/routes/route_generator.dart';
import 'package:dristi/src/core/services/routes/routes.dart';
import 'package:dristi/src/core/theme/colors.dart';
import 'package:dristi/src/core/theme/font_style.dart';
import 'package:dristi/src/core/utils/loggers/riverpod_logger.dart';
import 'package:dristi/src/core/utils/texts/text_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ),
  );

  runApp(
    ProviderScope(
      observers: [RiverpodLogger()],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          title: TextConstants.appName,
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            appBarTheme: AppBarTheme(
              backgroundColor: UIColors.white,
              elevation: 0,
              titleSpacing: 0,
              centerTitle: true,
              titleTextStyle: AppTypography.bold18Nova(
                color: UIColors.black,
              ),
              iconTheme: const IconThemeData(
                color: UIColors.black,
              ),
            ),
          ),
          onGenerateRoute: RouteGenerator.generateRoute,
          initialRoute: Routes.splash,
          navigatorKey: navigatorKey,
        );
      },
    );
  }
}
