import 'package:dristi/src/core/base/base_consumer_stateful_widget.dart';
import 'package:dristi/src/core/constants/app_values.dart';
import 'package:dristi/src/core/utils/localization_ext.dart';
import 'package:dristi/src/features/hotels_list/presentation/riverpod/hotels_list_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HotelsFilteredRow extends ConsumerStatefulWidget {
  const HotelsFilteredRow({
    required this.categoryController,
    required this.districtController,
    super.key,
  });

  final TextEditingController categoryController;
  final TextEditingController districtController;

  @override
  ConsumerState<HotelsFilteredRow> createState() => _FilteredRowState();
}

class _FilteredRowState extends BaseConsumerStatefulWidget<HotelsFilteredRow> {
  final bool isShowFavouritesList = false;

  @override
  Widget build(BuildContext context) {
    final districtFieldState = ref.watch(hotelsListDistrictField);

    final districtFieldNotifier = ref.read(hotelsListDistrictField.notifier);

    return SliverToBoxAdapter(
      child:
          districtFieldNotifier.state.isNotEmpty || isShowFavouritesList == true
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    if (isShowFavouritesList == true)
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