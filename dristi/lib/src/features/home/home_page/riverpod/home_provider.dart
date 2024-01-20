import 'package:dristi/src/features/home/categories/presentations/riverpod/categories_notifier.dart';
import 'package:dristi/src/features/home/categories/presentations/riverpod/categories_state.dart';
import 'package:dristi/src/features/home/popular_districts/presentations/riverpod/popular_districts_notifier.dart';
import 'package:dristi/src/features/home/popular_districts/presentations/riverpod/popular_districts_state.dart';
import 'package:dristi/src/features/home/sliders/presentations/riverpod/slider_notifier.dart';
import 'package:dristi/src/features/home/sliders/presentations/riverpod/slider_state.dart';
import 'package:dristi/src/features/home/top_destinations/presentations/riverpod/top_destinations_notifier.dart';
import 'package:dristi/src/features/home/top_destinations/presentations/riverpod/top_destinations_state.dart';
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

final topDestinationsProvider =
    NotifierProvider<TopDestinationsNotifier, TopDestinationsState>(
  TopDestinationsNotifier.new,
  name: 'topDestinationsProvider',
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
