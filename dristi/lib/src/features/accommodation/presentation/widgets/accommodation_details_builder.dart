import 'package:dristi/src/core/base/base_consumer_stateful_widget.dart';
import 'package:dristi/src/core/constants/app_values.dart';
import 'package:dristi/src/core/global_widgets/primary_snackbar.dart';
import 'package:dristi/src/core/utils/localization_ext.dart';
import 'package:dristi/src/features/accommodation/domain/entities/accommodation_entities.dart';
import 'package:dristi/src/features/accommodation/presentation/riverpod/accommodation_data/accommodation_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

class AccommodationScreenDetailsBuilder extends ConsumerStatefulWidget {
  const AccommodationScreenDetailsBuilder({
    super.key,
  });

  @override
  ConsumerState createState() => _AccommodationScreenDetailsBuilderState();
}

class _AccommodationScreenDetailsBuilderState
    extends BaseConsumerStatefulWidget<AccommodationScreenDetailsBuilder> {
  @override
  Widget build(BuildContext context) {
    final hotelDataState = ref.watch(accommodationProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(height: AppValues.dimen_16.h),
        Text(
          hotelDataState.data.title,
          style: appTextStyles.primaryNovaBold28,
        ),
        SizedBox(height: AppValues.dimen_10.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "${hotelDataState.data.district}, ${hotelDataState.data.division}",
              style: appTextStyles.primaryNovaBold16,
            ),
            _buildFindOnMapButton(),
          ],
        ),
        SizedBox(height: AppValues.dimen_10.h),
        Text(
          "${context.localization.address} ${hotelDataState.data.address}",
          style: appTextStyles.primaryNovaRegular16,
        ),
        SizedBox(height: AppValues.dimen_10.h),
        _buildWebsiteList(),
        SizedBox(height: AppValues.dimen_10.h),
        Text(
          hotelDataState.data.description,
          style: appTextStyles.secondaryNovaRegular16,
        ),
        SizedBox(height: AppValues.dimen_16.h),
      ],
    );
  }

  Widget _buildFindOnMapButton() {
    final hotelDataState = ref.watch(accommodationProvider);

    return GestureDetector(
      onTap: () {
        openUrls(hotelDataState.data.mapUrl);
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

  Widget _buildWebsiteList() {
    final hotelDataState = ref.watch(accommodationProvider);
    final List<WebsiteEntity> websites = hotelDataState.data.websites;

    if (websites.isEmpty) {
      return const SizedBox.shrink();
    }

    return Wrap(
      spacing: AppValues.dimen_8.w,
      runSpacing: AppValues.dimen_4.h,
      children: websites.map((website) {
        return GestureDetector(
          onTap: () {
            openUrls(website.url);
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
            child: Text(
              website.site,
              style: appTextStyles.primaryNovaRegular12,
            ),
          ),
        );
      }).toList(),
    );
  }

  void openUrls(String url) async {
    final googleMapsUrl = Uri.parse(url);

    if (await canLaunchUrl(googleMapsUrl)) {
      await launchUrl(googleMapsUrl);
    } else {
      errorSnackBar();
    }
  }

  void errorSnackBar() async {
    ShowSnackBarMessage.showErrorSnackBar(
      message: context.localization.couldNotLaunchUrl,
      context: context,
    );
  }
}
