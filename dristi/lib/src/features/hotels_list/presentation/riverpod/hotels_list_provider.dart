import 'package:dristi/src/features/hotels_list/presentation/riverpod/hotels_list_notifier.dart';
import 'package:dristi/src/features/hotels_list/presentation/riverpod/hotels_list_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final hotelsListProvider =
    NotifierProvider<HotelsListNotifier, HotelsListState>(
  HotelsListNotifier.new,
  name: 'hotelsListProvider',
);

final hotelsListSearchField = StateProvider.autoDispose<String>(
  (ref) => '',
  name: 'hotelsListSearchField',
);

final hotelsListDistrictField = StateProvider.autoDispose<String>(
  (ref) => '',
  name: 'hotelsListDistrictField',
);
