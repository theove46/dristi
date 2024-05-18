import 'package:dristi/src/core/constants/app_values.dart';
import 'package:dristi/src/core/theme/colors.dart';
import 'package:dristi/src/core/theme/text_styles.dart';
import 'package:dristi/src/core/utils/localization_ext.dart';
import 'package:dristi/src/features/home/home_screen/riverpod/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoriesBuilder extends ConsumerStatefulWidget {
  const CategoriesBuilder({super.key});

  @override
  ConsumerState createState() => _CategoriesBuilderState();
}

class _CategoriesBuilderState extends ConsumerState<CategoriesBuilder> {
  void _onTap() {
    final boxNotifier = ref.read(categoriesBoxHeight.notifier);
    final expandNotifier = ref.read(categoriesExpanded.notifier);

    if (expandNotifier.state) {
      boxNotifier.state = AppValues.dimen_240.h;
    } else {
      boxNotifier.state = AppValues.dimen_360.h;
    }
    expandNotifier.state = !expandNotifier.state;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTopHeadings(),
        _buildCategories(),
      ],
    );
  }

  Widget _buildTopHeadings() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: AppValues.dimen_10.h),
      child: Text(
        context.localization.categories,
        style: primaryNovaBold16,
      ),
    );
  }

  Widget _buildCategories() {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        _buildCategoriesList(),
        _buildExpandedButton(),
      ],
    );
  }

  Widget _buildCategoriesList() {
    final expandState = ref.watch(categoriesExpanded);
    final categoriesItems = ref.watch(categoriesProvider);

    return AnimatedContainer(
      duration: const Duration(milliseconds: 400),
      height: ref.watch(categoriesBoxHeight),
      width: 1.sw,
      margin: EdgeInsets.all(AppValues.dimen_2.r),
      padding: EdgeInsets.all(AppValues.dimen_16.r),
      decoration: BoxDecoration(
        color: UIColors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(AppValues.dimen_10.r),
        ),
        border: Border.all(
          color: UIColors.primary.withOpacity(0.5),
          width: 2.r,
        ),
      ),
      child: Align(
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
          child: categoriesItems.data != null
              ? Wrap(
                  runSpacing: 10.r,
                  spacing: 10.r,
                  children: [
                    ...categoriesItems.data.take(8).map(
                      (item) {
                        final index = categoriesItems.data.indexOf(item);
                        return _buildItems(index);
                      },
                    ),
                    if (expandState)
                      ...categoriesItems.data.skip(8).map(
                        (item) {
                          final index = categoriesItems.data.indexOf(item);

                          return _buildItems(index);
                        },
                      ),
                  ],
                )
              : Container(),
        ),
      ),
    );
  }

  Widget _buildItems(int index) {
    final categoriesItems = ref.watch(categoriesProvider);

    return SizedBox(
      width: AppValues.dimen_75.w,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: AppValues.dimen_10.h),
        child: categoriesItems.data != null
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(AppValues.dimen_6.r),
                    child: Image.network(
                      categoriesItems.data[index].image,
                      width: AppValues.dimen_60.r,
                      height: AppValues.dimen_60.r,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: AppValues.dimen_4.h),
                  Text(
                    categoriesItems.data[index].titleEn,
                    style: blackNovaSemiBold10,
                  ),
                ],
              )
            : Container(),
      ),
    );
  }

  Widget _buildExpandedButton() {
    final expandState = ref.watch(categoriesExpanded);

    return Positioned(
      bottom: -AppValues.dimen_8.h,
      child: GestureDetector(
        onTap: _onTap,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: AppValues.dimen_30.r,
              height: AppValues.dimen_30.r,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: UIColors.white,
                ),
                color: UIColors.white,
              ),
            ),
            Icon(
              expandState ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
              color: UIColors.primary,
              size: 30.h,
            ),
          ],
        ),
      ),
    );
  }
}
