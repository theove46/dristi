import 'package:dristi/src/core/cache/cache_service.dart';
import 'package:dristi/src/core/global_providers/saved_items/saved_items_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SavedItemsNotifier extends Notifier<SavedItemsState> {
  late CacheService cacheService;

  @override
  SavedItemsState build() {
    cacheService = ref.read(cacheServiceProvider);
    return const SavedItemsState();
  }

  void loadSavedItems() async {
    final savedList = await cacheService.getSavedItemsList();

    state = state.copyWith(
      data: savedList,
    );
  }

  void toggleSavedItems(String id) async {
    if (state.data.contains(id)) {
      state = state.copyWith(data: {...state.data}..remove(id));
    } else {
      state = state.copyWith(data: {...state.data}..add(id));
    }

    await cacheService.setSavedItemsList(state.data);
  }

  bool isSaved(int id) {
    return state.data.contains(id);
  }
}