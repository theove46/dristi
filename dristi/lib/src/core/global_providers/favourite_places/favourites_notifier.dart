import 'package:dristi/src/core/cache/cache_service.dart';
import 'package:dristi/src/core/global_providers/favourite_places/favourites_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavoritesNotifier extends Notifier<FavouritesState> {
  late CacheService cacheService;

  @override
  FavouritesState build() {
    cacheService = ref.read(cacheServiceProvider);
    return const FavouritesState();
  }

  void loadFavorites() async {
    final favoritesList = await cacheService.getFavoritesList();

    state = state.copyWith(
      data: favoritesList,
    );
  }

  void toggleFavorite(String destinationId) async {
    if (state.data.contains(destinationId)) {
      state = state.copyWith(data: {...state.data}..remove(destinationId));
    } else {
      state = state.copyWith(data: {...state.data}..add(destinationId));
    }

    await cacheService.setFavoritesList(state.data);
  }

  bool isFavorite(int destinationId) {
    return state.data.contains(destinationId);
  }
}
