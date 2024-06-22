import 'package:dristi/src/core/base/base_stateful_widget.dart';
import 'package:dristi/src/core/constants/app_assets.dart';
import 'package:dristi/src/core/constants/app_values.dart';
import 'package:dristi/src/core/utils/localization_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SliverEmptyListImage extends StatefulWidget {
  const SliverEmptyListImage({Key? key}) : super(key: key);

  @override
  State<SliverEmptyListImage> createState() => _SliverEmptyListImageState();
}

class _SliverEmptyListImageState
    extends BaseStatefulWidget<SliverEmptyListImage> {
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          SizedBox(height: AppValues.dimen_20.r),
          Text(
            context.localization.noResults,
            style: appTextStyles.primaryNovaSemiBold16,
          ),
          SizedBox(height: AppValues.dimen_10.r),
          Container(
            height: AppValues.dimen_200.r,
            width: AppValues.dimen_200.r,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(Assets.emptyList),
                fit: BoxFit.contain,
              ),
            ),
          ),
          SizedBox(height: AppValues.dimen_10.r),
          Text(
            context.localization.plantTrees,
            style: appTextStyles.primaryNovaSemiBold16,
          ),
        ],
      ),
    );
  }
}
