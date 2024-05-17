import 'package:dristi/app.dart';
import 'package:dristi/src/core/flavors/build_config.dart';
import 'package:dristi/src/core/flavors/env_config.dart';
import 'package:dristi/src/core/flavors/environment.dart';
import 'package:dristi/src/core/network/api_end_points.dart';
import 'package:dristi/src/core/loggers/riverpod_logger.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  EnvConfig prodConfig = EnvConfig(
    appName: "Dristi",
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

  final isFirstTime = await getFirstTimeStatus();

  runApp(
    ProviderScope(
      observers: [RiverpodLogger()],
      child: App(
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
