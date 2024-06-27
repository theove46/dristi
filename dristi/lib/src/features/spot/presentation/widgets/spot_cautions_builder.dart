import 'package:dristi/src/core/base/base_consumer_stateful_widget.dart';
import 'package:dristi/src/core/constants/app_global_texts.dart';
import 'package:dristi/src/core/constants/app_values.dart';
import 'package:dristi/src/core/utils/localization_ext.dart';
import 'package:dristi/src/features/spot/presentation/riverpod/spot_data/spot_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SpotScreenCautionsBuilder extends ConsumerStatefulWidget {
  const SpotScreenCautionsBuilder({
    super.key,
  });

  @override
  ConsumerState createState() => _SpotScreenCautionsBuilderState();
}

class _SpotScreenCautionsBuilderState
    extends BaseConsumerStatefulWidget<SpotScreenCautionsBuilder> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        _buildCommonCaution(),
        _buildCautionsList(),
      ],
    );
  }

  Widget _buildCautionsList() {
    final destinationDataState = ref.watch(spotProvider);
    final cautions = destinationDataState.data.cautions;

    return ListView.builder(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: cautions.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.symmetric(
            vertical: AppValues.dimen_4.r,
            horizontal: AppValues.dimen_10.r,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                TextConstants.listIndicator,
                style: appTextStyles.primaryNovaSemiBold16,
              ),
              Expanded(
                child: Text(
                  cautions[index],
                  style: appTextStyles.secondaryNovaRegular16,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildCommonCaution() {
    return Container(
      margin: EdgeInsets.all(AppValues.dimen_10.r),
      padding: EdgeInsets.all(AppValues.dimen_10.r),
      decoration: BoxDecoration(
        border: Border.all(color: uiColors.error),
        borderRadius: BorderRadius.circular(AppValues.dimen_10.r),
      ),
      child: Text(
        context.localization.commonCaution,
        style: appTextStyles.secondaryNovaRegular12,
      ),
    );
  }
}
