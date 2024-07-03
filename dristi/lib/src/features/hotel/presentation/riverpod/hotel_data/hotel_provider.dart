import 'package:dristi/src/features/hotel/presentation/riverpod/hotel_data/hotel_notifier.dart';
import 'package:dristi/src/features/hotel/presentation/riverpod/hotel_data/hotel_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final hotelProvider = NotifierProvider<HotelNotifier, HotelState>(
  HotelNotifier.new,
  name: 'hotelProvider',
);

final currentPageProvider = StateProvider.autoDispose.family<int, String>(
  (ref, instanceId) {
    return 0;
  },
  name: 'currentPageProvider',
);
