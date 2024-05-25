import 'package:dristi/src/core/styles/colors.dart';
import 'package:dristi/src/core/styles/texts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class BaseConsumerStatefulWidget<T extends ConsumerStatefulWidget>
    extends ConsumerState<T> {
  BaseConsumerStatefulWidget({Key? key});

  late UIColors uiColors;
  late AppTextStyles appTextStyles;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    uiColors = UIColors(context);
    appTextStyles = AppTextStyles(context);
  }
}
