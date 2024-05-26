import 'package:dristi/src/core/base/base_consumer_stateful_widget.dart';
import 'package:dristi/src/core/constants/app_values.dart';
import 'package:dristi/src/core/utils/localization_ext.dart';
import 'package:dristi/src/core/widgets/shimmers.dart';
import 'package:dristi/src/features/home/categories/presentations/riverpod/categories_state.dart';
import 'package:dristi/src/features/home/home_screen/riverpod/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoriesBuilder extends ConsumerStatefulWidget {
  const CategoriesBuilder({super.key});

  @override
  ConsumerState createState() => _CategoriesBuilderState();
}

class _CategoriesBuilderState
    extends BaseConsumerStatefulWidget<CategoriesBuilder> {
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
        style: appTextStyles.primaryNovaBold16,
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

    if (categoriesItems.status != CategoriesStatus.success ||
        categoriesItems.data == null) {
      return buildCategoriesShimmer(context);
    }

    return AnimatedContainer(
      duration: const Duration(milliseconds: 400),
      height: ref.watch(categoriesBoxHeight),
      margin: EdgeInsets.all(AppValues.dimen_2.r),
      padding: EdgeInsets.all(AppValues.dimen_16.r),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.all(
          Radius.circular(AppValues.dimen_10.r),
        ),
        border: Border.all(
          color: uiColors.primary.withOpacity(0.5),
          width: 2.r,
        ),
      ),
      child: Align(
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
          child: Wrap(
            runSpacing: 8.r,
            spacing: 8.r,
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
          ),
        ),
      ),
    );
  }

  Widget _buildItems(int index) {
    final categoriesItems = ref.watch(categoriesProvider);

    return SizedBox(
      width: AppValues.dimen_80.r,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: AppValues.dimen_10.h),
        child: Column(
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
              style: appTextStyles.secondaryNovaSemiBold10,
              textAlign: TextAlign.end,
            ),
          ],
        ),
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
                  color: uiColors.secondary,
                ),
                color: uiColors.secondary,
              ),
            ),
            Icon(
              expandState ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
            ),
          ],
        ),
      ),
    );
  }

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
}
