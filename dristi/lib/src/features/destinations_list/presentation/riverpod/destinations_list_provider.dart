import 'package:dristi/src/features/destinations_list/presentation/riverpod/destinations_list_notifier.dart';
import 'package:dristi/src/features/destinations_list/presentation/riverpod/destinations_list_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final destinationsListProvider =
    NotifierProvider<DestinationsListNotifier, DestinationsListState>(
  DestinationsListNotifier.new,
  name: 'destinationsListProvider',
);

final destinationsListSearchField = StateProvider.autoDispose<String>(
  (ref) => '',
  name: 'destinationsListSearchField',
);

final destinationsListCategoryField = StateProvider.autoDispose<String>(
  (ref) => '',
  name: 'destinationsListCategoryField',
);

final destinationsListDistrictField = StateProvider.autoDispose<String>(
  (ref) => '',
  name: 'destinationsListDistrictField',
);

final isShowFavouriteDestinationList = StateProvider.autoDispose<bool>(
  (ref) => false,
  name: 'isShowFavouriteDestinationList',
);
