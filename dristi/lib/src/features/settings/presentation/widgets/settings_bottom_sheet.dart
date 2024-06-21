import 'package:dristi/src/core/base/base_consumer_stateful_widget.dart';
import 'package:dristi/src/core/constants/app_values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingsBottomSheet extends ConsumerStatefulWidget {
  const SettingsBottomSheet({
    super.key,
    required this.title,
    required this.items,
    required this.selectedItem,
    required this.onItemSelected,
  });

  final String title;
  final List<SheetItem<dynamic>> items;
  final dynamic selectedItem;
  final Function(dynamic) onItemSelected;

  @override
  ConsumerState createState() => _SettingsBottomSheetState();
}

class _SettingsBottomSheetState
    extends BaseConsumerStatefulWidget<SettingsBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(AppValues.dimen_16.r),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(
            child: Container(
              height: AppValues.dimen_6.r,
              width: AppValues.dimen_60.r,
              decoration: BoxDecoration(
                color: uiColors.scrim,
                borderRadius: BorderRadius.circular(AppValues.dimen_8.r),
              ),
            ),
          ),
          SizedBox(
            height: AppValues.dimen_40.h,
          ),
          Padding(
            padding: EdgeInsets.only(left: AppValues.dimen_16.w),
            child: Text(
              widget.title,
              style: appTextStyles.secondaryNovaSemiBold20,
            ),
          ),
          const Divider(
            thickness: 0.5,
          ),
          for (var item in widget.items)
            ListTile(
              title: Text(
                item.title,
                style: appTextStyles.secondaryNovaRegular16,
              ),
              trailing: Radio<dynamic>(
                value: item.value,
                groupValue: widget.selectedItem,
                onChanged: (val) {
                  widget.onItemSelected(val!);
                  Navigator.pop(context);
                },
                activeColor: uiColors.primary,
                fillColor: WidgetStateColor.resolveWith((states) {
                  if (states.contains(WidgetState.selected)) {
                    return uiColors.primary;
                  }
                  return uiColors.primary;
                }),
              ),
            ),
        ],
      ),
    );
  }
}

class SheetItem<T> {
  final String title;
  final T value;

  SheetItem({
    required this.title,
    required this.value,
  });
}
