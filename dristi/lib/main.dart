import 'package:dristi/firebase_options.dart';
import 'package:dristi/src/core/constants/app_values.dart';
import 'package:dristi/src/core/flavors/build_config.dart';
import 'package:dristi/src/core/flavors/env_config.dart';
import 'package:dristi/src/core/flavors/environment.dart';
import 'package:dristi/src/core/network/api_end_points.dart';
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
import 'package:hive_flutter/hive_flutter.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  EnvConfig prodConfig = EnvConfig(
    appName: TextConstants.appName,
    baseUrl: API.prod,
    shouldCollectCrashLog: true,
  );

  BuildConfig.instantiate(
    envType: Environment.prod,
    envConfig: prodConfig,
  );

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ),
  );

  await Hive.initFlutter();

  final isFirstTime = await getFirstTimeStatus();

  runApp(
    ProviderScope(
      observers: [RiverpodLogger()],
      child: MyApp(
        isFirstTime: isFirstTime,
      ),
    ),
  );
}

Future<bool> getFirstTimeStatus() async {
  final settingsBox = await Hive.openBox<bool>('appSettings');
  bool? isFirstTime = settingsBox.get('isFirstTime');
  return isFirstTime ?? true;
}

class MyApp extends StatelessWidget {
  const MyApp({
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
          initialRoute: isFirstTime ? Routes.splash : Routes.home,
          navigatorKey: navigatorKey,
        );
      },
    );
  }
}
