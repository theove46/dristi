import 'package:dristi/src/core/assets/assets.dart';
import 'package:dristi/src/core/theme/colors.dart';
import 'package:dristi/src/core/theme/font_style.dart';
import 'package:dristi/src/core/utils/texts/text_constants.dart';
import 'package:dristi/src/features/home/presentation/widgets/categories_builder.dart';
import 'package:dristi/src/features/home/presentation/widgets/image_slider_builder.dart';
import 'package:dristi/src/features/home/presentation/widgets/popular_districts.dart';
import 'package:dristi/src/features/home/presentation/widgets/top_destinations_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
        leading: Padding(
          padding: EdgeInsets.only(left: 16.sp),
          child: const Image(
            image: AssetImage(Assets.menu),
          ),
        ),
        leadingWidth: 50,
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(16.h, 0.h, 16.h, 16.h),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ImageSliderBuilder(),
              _buildTitleMessage(),
              const CategoriesBuilder(),
              const TopDestinationBuilder(),
              const PopularDistrictsBuilder(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTitleMessage() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 10.sp),
        Text(
          TextConstants.exploreThe,
          style: AppTypography.mediumBold24Nova(
            color: UIColors.primary,
          ),
        ),
        SizedBox(height: 10.sp),
        Text(
          TextConstants.beautifulBD,
          style: AppTypography.bold28Nova(
            color: UIColors.primary,
          ),
        ),
      ],
    );
  }
}
