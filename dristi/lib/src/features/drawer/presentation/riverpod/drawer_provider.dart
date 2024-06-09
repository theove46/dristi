import 'package:flutter_riverpod/flutter_riverpod.dart';

final themeProvider = StateProvider<String>(
  (ref) => 'default',
  name: 'themeProvider',
);

final languageProvider = StateProvider<String>(
  (ref) => 'en',
  name: 'languageProvider',
);
