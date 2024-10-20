import 'package:dristi/src/core/global_providers/deep_linking_providers/deep_linking_notifier.dart';
import 'package:dristi/src/core/global_providers/deep_linking_providers/deep_linking_state.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

final deepLinkingProvider =
    NotifierProvider<DeepLinkingNotifier, DeepLinkingState>(
  DeepLinkingNotifier.new,
  name: 'deepLinkingProvider',
);
