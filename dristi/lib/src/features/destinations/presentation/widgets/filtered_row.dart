import 'package:dristi/src/core/base/base_consumer_stateful_widget.dart';
import 'package:dristi/src/core/constants/app_values.dart';
import 'package:dristi/src/core/utils/localization_ext.dart';
import 'package:dristi/src/features/destinations/presentation/riverpod/destination_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FilteredRow extends ConsumerStatefulWidget {
  const FilteredRow({
    required this.categoryController,
    required this.districtController,
    super.key,
  });

  final TextEditingController categoryController;
  final TextEditingController districtController;

  @override
  ConsumerState<FilteredRow> createState() => _FilteredRowState();
}

class _FilteredRowState extends BaseConsumerStatefulWidget<FilteredRow> {
  @override
  Widget build(BuildContext context) {
    final categoryFieldState = ref.watch(destinationsCategoryField);
    final districtFieldState = ref.watch(destinationsDistrictField);

    final categoryFieldNotifier = ref.read(destinationsCategoryField.notifier);
    final districtFieldNotifier = ref.read(destinationsDistrictField.notifier);

    final isShowFavouriteDestinationsState =
        ref.watch(favouriteDestinationList);

    return SliverToBoxAdapter(
      child: categoryFieldNotifier.state.isNotEmpty ||
              districtFieldNotifier.state.isNotEmpty ||
              isShowFavouriteDestinationsState
          ? Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                if (isShowFavouriteDestinationsState)
                  _buildFilterItem(
                    text: context.localization.favouritePlaces,
                    isCloseIcon: false,
                  ),
                if (districtFieldState.isNotEmpty)
                  _buildFilterItem(
                    text: districtFieldState,
                    onTap: () {
                      districtFieldNotifier.state = '';
                      widget.districtController.clear();
                    },
                    isCloseIcon: true,
                  ),
                if (categoryFieldState.isNotEmpty)
                  _buildFilterItem(
                    text: categoryFieldState,
                    onTap: () {
                      categoryFieldNotifier.state = '';
                      widget.categoryController.clear();
                    },
                    isCloseIcon: true,
                  ),
              ],
            )
          : const SizedBox.shrink(),
    );
  }

  Widget _buildFilterItem({
    required String text,
    VoidCallback? onTap,
    required bool isCloseIcon,
  }) {
    return Container(
      margin: EdgeInsets.only(left: AppValues.dimen_16.w),
      padding: EdgeInsets.symmetric(
        horizontal: AppValues.dimen_12.r,
        vertical: AppValues.dimen_6.r,
      ),
      decoration: BoxDecoration(
        color: uiColors.scrim,
        borderRadius: BorderRadius.circular(AppValues.dimen_10.r),
        // border: Border.all(color: Colors.grey),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            text,
            style: appTextStyles.secondaryNovaRegular12,
          ),
          SizedBox(width: AppValues.dimen_4.w),
          GestureDetector(
            onTap: onTap,
            child: Icon(
              isCloseIcon ? Icons.close : Icons.favorite,
              size: AppValues.dimen_16.sp,
            ),
          ),
        ],
      ),
    );
  }
}
