import 'package:dristi/src/features/accommodations_list/presentation/riverpod/accommodations_list_notifier.dart';
import 'package:dristi/src/features/accommodations_list/presentation/riverpod/accommodations_list_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final accommodationsListProvider =
    NotifierProvider<AccommodationsListNotifier, AccommodationsListState>(
  AccommodationsListNotifier.new,
  name: 'accommodationsListProvider',
);
