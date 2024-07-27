import 'package:cached_network_image/cached_network_image.dart';
import 'package:dristi/src/core/utils/enums.dart';
import 'package:dristi/src/core/base/base_consumer_stateful_widget.dart';
import 'package:dristi/src/core/constants/app_values.dart';
import 'package:dristi/src/core/utils/localization_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class FilteredBottomSheet extends ConsumerStatefulWidget {
  const FilteredBottomSheet({
    super.key,
    required this.items,
    required this.notifier,
    required this.controller,
    required this.text,
    required this.type,
  });

  final List items;
  final StateController<String> notifier;
  final TextEditingController controller;
  final String text;
  final DestinationFilters type;

  @override
  ConsumerState<FilteredBottomSheet> createState() =>
      _FilteredBottomSheetState();
}

class _FilteredBottomSheetState
    extends BaseConsumerStatefulWidget<FilteredBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(AppValues.dimen_24.r),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.text,
                style: appTextStyles.primaryNovaBold20,
              ),
              IconButton(
                icon: Icon(
                  Icons.close,
                  size: AppValues.dimen_20.r,
                ),
                onPressed: () {
                  context.pop();
                },
              ),
            ],
          ),
          SizedBox(
            height: AppValues.dimen_500.h,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: widget.items.length,
              itemBuilder: (context, index) {
                final item = widget.items[index];

                // Removed All Category Option
                if (item.title == context.localization.allCategories) {
                  return const SizedBox.shrink();
                }

                final isSelected = item.title == widget.notifier.state;

                return GestureDetector(
                  onTap: () {
                    if (isSelected) {
                      widget.controller.clear();
                      widget.notifier.state = '';
                    } else {
                      widget.controller.text = item.title;
                      widget.notifier.state = item.title;
                    }
                    context.pop();
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: AppValues.dimen_16.r,
                      vertical: AppValues.dimen_10.r,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(AppValues.dimen_8.r),
                      color: isSelected
                          ? uiColors.secondary
                          : uiColors.transparent,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item.title,
                              style: appTextStyles.secondaryNovaRegular16,
                            ),

                            // Divisions only for District Filtering
                            if (widget.type == DestinationFilters.district)
                              Text(
                                item.division,
                                style: appTextStyles.secondaryNovaRegular12,
                              ),
                          ],
                        ),

                        // Images only for Category Filtering
                        if (widget.type == DestinationFilters.category)
                          CachedNetworkImage(
                            imageUrl: item.image,
                            width: AppValues.dimen_40.r,
                            height: AppValues.dimen_40.r,
                            fit: BoxFit.cover,
                          ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
