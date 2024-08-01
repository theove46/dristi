import 'package:dristi/src/core/utils/enums.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final bottomNavBarProvider = StateProvider<BottomNavItems>(
  (ref) => BottomNavItems.home,
  name: 'bottomNavBarProvider',
);
