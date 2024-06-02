import 'package:dristi/src/features/on_boarding/presentation/riverpod/on_boarding_notifier.dart';
import 'package:dristi/src/features/on_boarding/presentation/riverpod/on_boarding_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final onBoardingProvider =
    NotifierProvider<OnBoardingNotifier, OnBoardingState>(
  OnBoardingNotifier.new,
  name: 'splashProvider',
);

final currentOnBoardingScreenProvider = StateProvider<int>(
  (ref) => 0,
  name: 'currentSplashProvider',
);
