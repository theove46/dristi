import 'package:dristi/src/features/destinations/presentation/riverpod/destination_notifier.dart';
import 'package:dristi/src/features/destinations/presentation/riverpod/destination_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final destinationProvider =
    NotifierProvider<DestinationNotifier, DestinationState>(
  DestinationNotifier.new,
  name: 'districtProvider',
);

final destinationsSearchField = StateProvider.autoDispose<String>(
  (ref) => '',
  name: 'destinationsSearchField',
);

final destinationsCategoryField = StateProvider.autoDispose<String>(
  (ref) => '',
  name: 'destinationsCategoryField',
);

final destinationsDistrictField = StateProvider.autoDispose<String>(
  (ref) => '',
  name: 'destinationsDistrictField',
);

final favouriteDestinationList = StateProvider.autoDispose<bool>(
  (ref) => false,
  name: 'favouriteDestinationList',
);
