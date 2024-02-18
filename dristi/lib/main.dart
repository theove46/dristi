import 'package:dristi/firebase_options.dart';
import 'package:dristi/src/core/constants/app_values.dart';
import 'package:dristi/src/core/services/routes/route_generator.dart';
import 'package:dristi/src/core/services/routes/routes.dart';
import 'package:dristi/src/core/theme/colors.dart';
import 'package:dristi/src/core/loggers/riverpod_logger.dart';
import 'package:dristi/src/core/constants/text_constants.dart';
import 'package:dristi/src/core/theme/text_styles.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
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
      designSize:
          const Size(AppValues.dimenDefaultWidth, AppValues.dimenDefaultHeight),
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
              titleTextStyle: blackNovaBold18,
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
