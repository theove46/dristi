import 'package:dristi/app.dart';
import 'package:dristi/src/core/constants/app_global_texts.dart';
import 'package:dristi/src/core/flavors/build_config.dart';
import 'package:dristi/src/core/flavors/env_config.dart';
import 'package:dristi/src/core/flavors/environment.dart';
import 'package:dristi/src/core/constants/app_end_points.dart';
import 'package:dristi/src/core/loggers/riverpod_logger.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

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

  BuildConfig.instantiate(
    envType: Environment.prod,
    envConfig: prodConfig,
  );

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ),
  );

  await Hive.initFlutter();

  runApp(
    ProviderScope(
      observers: [RiverpodLogger()],
      child: const App(),
    ),
  );
}
