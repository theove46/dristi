import 'package:dristi/src/core/theme/colors.dart';
import 'package:dristi/src/core/theme/font_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Home Page',
          style: AppTypography.bold18Nova(
            color: UIColors.black,
          ),
        ),
      ),
      body: Center(
        child: Text(
          'Home Page',
          style: AppTypography.bold18Nova(
            color: UIColors.black,
          ),
        ),
      ),
    );
  }
}
