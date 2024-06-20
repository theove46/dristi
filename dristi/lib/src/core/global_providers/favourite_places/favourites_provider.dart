import 'package:dristi/src/core/global_providers/favourite_places/favourites_notifier.dart';
import 'package:dristi/src/core/global_providers/favourite_places/favourites_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final favoritesProvider = NotifierProvider<FavoritesNotifier, FavouritesState>(
  FavoritesNotifier.new,
  name: 'favoritesProvider',
);
