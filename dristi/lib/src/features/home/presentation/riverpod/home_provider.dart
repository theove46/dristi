import 'package:dristi/src/features/home/presentation/riverpod/categories/categories_notifier.dart';
import 'package:dristi/src/features/home/presentation/riverpod/categories/categories_state.dart';
import 'package:dristi/src/features/home/presentation/riverpod/popular_districts/popular_districts_notifier.dart';
import 'package:dristi/src/features/home/presentation/riverpod/popular_districts/popular_districts_state.dart';
import 'package:dristi/src/features/home/presentation/riverpod/slider/slider_notifier.dart';
import 'package:dristi/src/features/home/presentation/riverpod/slider/slider_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final categoriesProvider =
    NotifierProvider<CategoriesNotifier, CategoriesState>(
  CategoriesNotifier.new,
  name: 'categoriesProvider',
);

final popularDistrictProvider =
    NotifierProvider<PopularDistrictNotifier, PopularDistrictState>(
  PopularDistrictNotifier.new,
  name: 'popularDistrictProvider',
);

final sliderProvider = NotifierProvider<SliderNotifier, SliderState>(
  SliderNotifier.new,
  name: 'sliderProvider',
);

final currentSlideProvider = StateProvider<int>(
  (ref) => 0,
  name: 'currentSlideProvider',
);

final categoriesBoxHeight = StateProvider<double>(
  (ref) => 220.0,
  name: 'categoriesBoxHeight',
);

final categoriesExpanded = StateProvider<bool>(
  (ref) => false,
  name: 'categoriesExpanded',
);
