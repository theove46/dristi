import 'package:dristi/src/core/global_providers/favourite_places/favourites_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavoritesNotifier extends Notifier<FavouritesState> {
  @override
  FavouritesState build() {
    return const FavouritesState();
  }

  void toggleFavorite(String destinationId) {
    if (state.data.contains(destinationId)) {
      state = state.copyWith(data: {...state.data}..remove(destinationId));
    } else {
      state = state.copyWith(data: {...state.data}..add(destinationId));
    }
  }

  bool isFavorite(int destinationId) {
    return state.data.contains(destinationId);
  }
}
