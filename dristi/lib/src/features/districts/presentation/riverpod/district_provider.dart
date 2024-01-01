import 'package:dristi/src/features/districts/presentation/riverpod/district_notifier.dart';
import 'package:dristi/src/features/districts/presentation/riverpod/district_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final districtProvider = NotifierProvider<DistrictNotifier, DistrictState>(
  DistrictNotifier.new,
  name: 'districtProvider',
);
