import 'package:dristi/src/core/theme/colors.dart';
import 'package:dristi/src/core/theme/font_style.dart';
import 'package:dristi/src/core/utils/texts/text_constants.dart';
import 'package:dristi/src/features/home/data/categories_model.dart';
import 'package:dristi/src/features/home/presentation/riverpod/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoriesBuilder extends ConsumerStatefulWidget {
  const CategoriesBuilder({super.key});

  @override
  ConsumerState createState() => _CategoriesBuilderState();
}

class _CategoriesBuilderState extends ConsumerState<CategoriesBuilder> {
  final List<CategoriesModel> categoriesItems = CategoriesModel.fetchAllData();

  void _onTap() {
    final boxNotifier = ref.read(categoriesBoxHeight.notifier);
    final expandNotifier = ref.read(categoriesExpanded.notifier);

    if (expandNotifier.state) {
      boxNotifier.state = 200.0;
    } else {
      boxNotifier.state = 300.0;
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
      padding: EdgeInsets.symmetric(vertical: 16.sp),
      child: Text(
        TextConstants.categories,
        style: AppTypography.bold16Nova(
          color: UIColors.primary,
        ),
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

    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      height: ref.watch(categoriesBoxHeight),
      width: 1.sw,
      margin: EdgeInsets.all(2.h),
      padding: EdgeInsets.all(10.h),
      decoration: BoxDecoration(
        color: UIColors.white,
        borderRadius: BorderRadius.all(Radius.circular(10.r)),
        border: Border.all(
          color: UIColors.primary.withOpacity(0.5),
          width: 2,
        ),
      ),
      child: SingleChildScrollView(
        child: Wrap(
          runSpacing: 1.h,
          children: [
            ...categoriesItems.take(8).map(
              (item) {
                final index = categoriesItems.indexOf(item);
                return _buildItems(index);
              },
            ),
            if (expandState)
              ...categoriesItems.skip(8).map(
                (item) {
                  final index = categoriesItems.indexOf(item);

                  return _buildItems(index);
                },
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildItems(int index) {
    return SizedBox(
      width: 75.w,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(6.r),
              child: Image.asset(
                categoriesItems[index].image,
                width: 50.sp,
                height: 50.sp,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 4.sp),
            Text(
              categoriesItems[index].title,
              style: AppTypography.semiBold10Nova(
                color: UIColors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildExpandedButton() {
    final expandState = ref.watch(categoriesExpanded);

    return Positioned(
      bottom: -8.h,
      child: GestureDetector(
        onTap: _onTap,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                border: Border.all(
                  color: UIColors.white,
                ),
                color: UIColors.white,
              ),
            ),
            Icon(
              expandState ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
              color: UIColors.primary,
              size: 30,
            ),
          ],
        ),
      ),
    );
  }
}
