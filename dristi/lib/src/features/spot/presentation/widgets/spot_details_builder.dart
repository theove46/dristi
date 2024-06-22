import 'package:dristi/src/core/base/base_consumer_stateful_widget.dart';
import 'package:dristi/src/core/constants/app_values.dart';
import 'package:dristi/src/core/utils/localization_ext.dart';
import 'package:dristi/src/features/spot/domain/entities/spot_entities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SpotScreenDetailsBuilder extends ConsumerStatefulWidget {
  const SpotScreenDetailsBuilder({
    required this.destination,
    super.key,
  });

  final SpotEntity destination;

  @override
  ConsumerState createState() => _SpotScreenDetailsBuilderState();
}

class _SpotScreenDetailsBuilderState
    extends BaseConsumerStatefulWidget<SpotScreenDetailsBuilder> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          widget.destination.title,
          style: appTextStyles.primaryNovaBold28,
        ),
        SizedBox(height: AppValues.dimen_10.h),
        GestureDetector(
          onTap: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "${widget.destination.district}, ${widget.destination.division}",
                style: appTextStyles.primaryNovaBold16,
              ),
              Row(
                children: [
                  Text(
                    context.localization.findOnMap,
                    style: appTextStyles.primaryNovaRegular12,
                  ),
                  Icon(
                    Icons.location_on_rounded,
                    color: uiColors.primary,
                    size: AppValues.dimen_16.r,
                  ),
                  SizedBox(width: AppValues.dimen_10.w),
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: AppValues.dimen_10.h),
        Text(
          widget.destination.details,
          style: appTextStyles.secondaryNovaRegular16,
        ),
        SizedBox(height: AppValues.dimen_16.h),
      ],
    );
  }
}
