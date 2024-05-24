import 'package:dristi/src/core/styles/texts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class BaseConsumerStatefulWidget<T extends ConsumerStatefulWidget>
    extends ConsumerState<T> {
  BaseConsumerStatefulWidget({Key? key});

  late AppTextStyles appTextStyles;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    appTextStyles = AppTextStyles(context);
  }
}
