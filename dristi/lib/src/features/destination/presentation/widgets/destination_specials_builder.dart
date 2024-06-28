import 'package:dristi/src/core/base/base_consumer_stateful_widget.dart';
import 'package:dristi/src/core/constants/app_global_texts.dart';
import 'package:dristi/src/core/constants/app_values.dart';
import 'package:dristi/src/core/global_widgets/empty_list_image.dart';
import 'package:dristi/src/features/destination/presentation/riverpod/destination_data/destination_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DestinationScreenSpecialsBuilder extends ConsumerStatefulWidget {
  const DestinationScreenSpecialsBuilder({
    super.key,
  });

  @override
  ConsumerState createState() => _DestinationScreenSpecialsBuilderState();
}

class _DestinationScreenSpecialsBuilderState
    extends BaseConsumerStatefulWidget<DestinationScreenSpecialsBuilder> {
  @override
  Widget build(BuildContext context) {
    final destinationDataState = ref.watch(destinationProvider);

    final specials = destinationDataState.data.specials;

    if (specials.isEmpty) {
      return const EmptyListImage();
    }

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
