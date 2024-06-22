import 'package:dristi/src/features/spot/presentation/riverpod/spot_items/spot_item_notifier.dart';
import 'package:dristi/src/features/spot/presentation/riverpod/spot_items/spot_item_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final spotItemsProvider = NotifierProvider<SpotItemsNotifier, SpotItemsState>(
  SpotItemsNotifier.new,
  name: 'spotItemsProvider',
);
