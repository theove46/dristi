import 'package:dristi/src/core/global_providers/favourites_items/favourites_items_notifier.dart';
import 'package:dristi/src/core/global_providers/favourites_items/favourites_items_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final savedItemsProvider =
    NotifierProvider<SavedItemsNotifier, SavedItemsState>(
  SavedItemsNotifier.new,
  name: 'savedItemsProvider',
);
