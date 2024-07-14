import 'package:dristi/src/features/destinations_list/presentation/riverpod/destinations_list_notifier.dart';
import 'package:dristi/src/features/destinations_list/presentation/riverpod/destinations_list_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final destinationsListProvider =
    NotifierProvider<DestinationsListNotifier, DestinationsListState>(
  DestinationsListNotifier.new,
  name: 'destinationsListProvider',
);
