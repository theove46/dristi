import 'package:dristi/src/features/spot/presentation/riverpod/spot_notifier.dart';
import 'package:dristi/src/features/spot/presentation/riverpod/spot_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final spotItemsProvider = NotifierProvider<SpotItemsNotifier, SpotItemsState>(
  SpotItemsNotifier.new,
  name: 'spotItemsProvider',
);

final currentPageProvider = StateProvider<int>(
  (ref) => 0,
  name: 'currentPageProvider',
);
