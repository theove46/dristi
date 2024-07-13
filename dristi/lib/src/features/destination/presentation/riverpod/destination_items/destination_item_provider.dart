import 'package:dristi/src/features/destination/presentation/riverpod/destination_items/destination_item_notifier.dart';
import 'package:dristi/src/features/destination/presentation/riverpod/destination_items/destination_item_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final destinationItemsProvider =
    NotifierProvider<DestinationItemsNotifier, DestinationItemsState>(
  DestinationItemsNotifier.new,
  name: 'destinationItemsProvider',
);
