import 'package:dristi/src/core/base/base_consumer_stateful_widget.dart';
import 'package:dristi/src/core/constants/app_values.dart';
import 'package:dristi/src/core/global_providers/language_settings/language_settings_provider.dart';
import 'package:dristi/src/core/global_widgets/advertisement_image.dart';
import 'package:dristi/src/core/global_widgets/shimmers.dart';
import 'package:dristi/src/core/utils/localization_ext.dart';
import 'package:dristi/src/features/home/home_screen/riverpod/home_provider.dart';
import 'package:dristi/src/features/destination/presentation/riverpod/destination_data/destination_provider.dart';
import 'package:dristi/src/features/destination/presentation/riverpod/destination_items/destination_item_provider.dart';
import 'package:dristi/src/features/destination/presentation/widgets/spot_items_builder.dart';
import 'package:dristi/src/features/destination/presentation/widgets/top_screen_icons.dart';
import 'package:dristi/src/features/destination/presentation/widgets/spot_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DestinationScreen extends ConsumerStatefulWidget {
  const DestinationScreen({
    required this.id,
    required this.instanceId,
    super.key,
  });

  final String id;
  final String instanceId;

  @override
  ConsumerState createState() => _DestinationScreenState();
}

class _DestinationScreenState
    extends BaseConsumerStatefulWidget<DestinationScreen> {
  @override
  void initState() {
    super.initState();
    Future(() {
      fetchComponents();
    });
  }

  Future<void> fetchComponents() async {
    final appLanguageState =
        ref.watch(languageProvider).language.toLanguage.languageCode;
    ref.read(destinationProvider.notifier).getDestinationData(
          appLanguageState,
          widget.id,
        );
    ref.read(spotItemsProvider.notifier).getDestinationItems(appLanguageState);
    ref
        .read(singleAdvertisementProvider.notifier)
        .getSingleAdvertisementComponents();
  }

  @override
  Widget build(BuildContext context) {
    final destinationDataState = ref.watch(destinationProvider);

    if (destinationDataState.data == null) {
      return buildFullViewShimmer(context);
    }

    return Scaffold(
      body: Stack(
        children: [
          SpotImage(destination: destinationDataState.data),
          _buildDescription(),
          TopScreenIcons(
            destinationId: widget.id,
          ),
        ],
      ),
    );
  }

  Widget _buildDescription() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: AppValues.dimen_480.h),
          Container(
            decoration: BoxDecoration(
              color: uiColors.secondary,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(AppValues.dimen_20.r),
                topRight: Radius.circular(AppValues.dimen_20.r),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.all(AppValues.dimen_16.r),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AdvertisementImage(),
                  SpotScreenItemsBuilder(
                    instanceId: widget.instanceId,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
