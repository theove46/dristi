import 'package:dristi/src/core/base/base_consumer_stateful_widget.dart';
import 'package:dristi/src/core/constants/app_global_texts.dart';
import 'package:dristi/src/core/constants/app_values.dart';
import 'package:dristi/src/features/spot/presentation/riverpod/spot_data/spot_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SpotScreenSpecialsBuilder extends ConsumerStatefulWidget {
  const SpotScreenSpecialsBuilder({
    super.key,
  });

  @override
  ConsumerState createState() => _SpotScreenSpecialsBuilderState();
}

class _SpotScreenSpecialsBuilderState
    extends BaseConsumerStatefulWidget<SpotScreenSpecialsBuilder> {
  @override
  Widget build(BuildContext context) {
    final destinationDataState = ref.watch(spotProvider);

    final specials = destinationDataState.data.specials;

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        ListView.builder(
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: specials.length,
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
                      specials[index],
                      style: appTextStyles.secondaryNovaRegular16,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
