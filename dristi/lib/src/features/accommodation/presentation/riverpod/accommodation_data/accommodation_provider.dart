import 'package:dristi/src/features/accommodation/presentation/riverpod/accommodation_data/accommodation_notifier.dart';
import 'package:dristi/src/features/accommodation/presentation/riverpod/accommodation_data/accommodation_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final accommodationProvider =
    NotifierProvider<AccommodationNotifier, AccommodationState>(
  AccommodationNotifier.new,
  name: 'accommodationProvider',
);
