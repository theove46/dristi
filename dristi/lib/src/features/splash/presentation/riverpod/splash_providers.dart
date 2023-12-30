import 'package:dristi/src/features/splash/presentation/riverpod/splash_notifier.dart';
import 'package:dristi/src/features/splash/presentation/riverpod/splash_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final splashProvider = NotifierProvider<SplashNotifier, SplashState>(
  SplashNotifier.new,
  name: 'splashProvider',
);

final currentSplashProvider = StateProvider<int>(
  (ref) => 0,
  name: 'currentSplashProvider',
);
