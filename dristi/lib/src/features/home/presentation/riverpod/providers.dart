import 'package:flutter_riverpod/flutter_riverpod.dart';

final currentSlideProvider = StateProvider<int>((ref) => 0);
final categoriesBoxHeight = StateProvider<double>((ref) => 200.0);
final categoriesExpanded = StateProvider<bool>((ref) => false);
