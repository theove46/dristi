import 'package:dristi/src/features/spot/presentation/riverpod/spot_data/spot_notifier.dart';
import 'package:dristi/src/features/spot/presentation/riverpod/spot_data/spot_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final spotProvider = NotifierProvider<SpotNotifier, SpotState>(
  SpotNotifier.new,
  name: 'spotProvider',
);

final currentPageProvider = StateProvider.autoDispose.family<int, String>(
  (ref, instanceId) {
    return 0;
  },
  name: 'currentPageProvider',
);
