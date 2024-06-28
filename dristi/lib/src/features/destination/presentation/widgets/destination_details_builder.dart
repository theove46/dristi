import 'package:dristi/src/core/base/base_consumer_stateful_widget.dart';
import 'package:dristi/src/core/constants/app_values.dart';
import 'package:dristi/src/core/global_widgets/primary_snackbar.dart';
import 'package:dristi/src/core/utils/localization_ext.dart';
import 'package:dristi/src/features/destination/presentation/riverpod/destination_data/destination_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

class DestinationScreenDetailsBuilder extends ConsumerStatefulWidget {
  const DestinationScreenDetailsBuilder({
    super.key,
  });

  @override
  ConsumerState createState() => _DestinationScreenDetailsBuilderState();
}

class _DestinationScreenDetailsBuilderState
    extends BaseConsumerStatefulWidget<DestinationScreenDetailsBuilder> {
  @override
  Widget build(BuildContext context) {
    final destinationDataState = ref.watch(destinationProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          destinationDataState.data.title,
          style: appTextStyles.primaryNovaBold28,
        ),
        SizedBox(height: AppValues.dimen_10.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "${destinationDataState.data.district}, ${destinationDataState.data.division}",
              style: appTextStyles.primaryNovaBold16,
            ),
            _buildFindOnMapButton(),
          ],
        ),
        SizedBox(height: AppValues.dimen_10.h),
        Text(
          destinationDataState.data.details,
          style: appTextStyles.secondaryNovaRegular16,
        ),
        SizedBox(height: AppValues.dimen_16.h),
      ],
    );
  }

  Widget _buildFindOnMapButton() {
    return GestureDetector(
      onTap: () {
        openGoogleMaps();
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: AppValues.dimen_12.r,
          vertical: AppValues.dimen_12.r,
        ),
        decoration: BoxDecoration(
          color: uiColors.scrim,
          borderRadius: BorderRadius.circular(
            AppValues.dimen_10.r,
          ),
        ),
        child: Row(
          children: [
            Text(
              context.localization.findOnMap,
              style: appTextStyles.primaryNovaRegular12,
            ),
            SizedBox(width: AppValues.dimen_10.w),
            Icon(
              Icons.location_on_rounded,
              color: uiColors.primary,
              size: AppValues.dimen_16.r,
            ),
          ],
        ),
      ),
    );
  }

  void errorSnackBar() async {
    ShowSnackBarMessage.showErrorSnackBar(
      message: context.localization.couldNotLaunchMap,
      context: context,
    );
  }

  void openGoogleMaps() async {
    final destinationDataState = ref.watch(destinationProvider);
    final googleMapsUrl = Uri.parse(destinationDataState.data.mapUrl);

    if (await canLaunchUrl(googleMapsUrl)) {
      await launchUrl(googleMapsUrl);
    } else {
      errorSnackBar();
    }
  }
}
