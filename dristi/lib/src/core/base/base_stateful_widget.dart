import 'package:dristi/src/core/styles/colors/colors.dart';
import 'package:dristi/src/core/styles/texts/texts.dart';
import 'package:flutter/material.dart';

abstract class BaseStatefulWidget<T extends StatefulWidget> extends State<T> {
  BaseStatefulWidget({Key? key});

  late UIColors uiColors;
  late AppTextStyles appTextStyles;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    uiColors = UIColors(context);
    appTextStyles = AppTextStyles(context);
  }
}
