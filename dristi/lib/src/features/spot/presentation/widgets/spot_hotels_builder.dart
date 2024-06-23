import 'package:cached_network_image/cached_network_image.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dristi/src/core/base/base_consumer_stateful_widget.dart';
import 'package:dristi/src/core/constants/app_values.dart';
import 'package:dristi/src/core/global_providers/language_settings/language_settings_provider.dart';
import 'package:dristi/src/core/global_providers/network_status/network_status_provider.dart';
import 'package:dristi/src/core/global_widgets/empty_list_image.dart';
import 'package:dristi/src/core/utils/localization_ext.dart';
import 'package:dristi/src/features/hotels_list/presentation/riverpod/hotels_list_provider.dart';
import 'package:dristi/src/features/spot/domain/entities/spot_entities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SpotScreenHotelsBuilder extends ConsumerStatefulWidget {
  const SpotScreenHotelsBuilder({
    required this.destination,
    super.key,
  });

  final SpotEntity destination;

  @override
  ConsumerState createState() => _SpotScreenHotelsBuilderState();
}

class _SpotScreenHotelsBuilderState
    extends BaseConsumerStatefulWidget<SpotScreenHotelsBuilder> {
  @override
  void initState() {
    super.initState();
    Future(() {
      _getDestinationComponents();
    });
  }

  Future<void> _getDestinationComponents() async {
    final appLanguageState =
        ref.watch(languageProvider).language.toLanguage.languageCode;

    ref
        .read(hotelsListProvider.notifier)
        .getHotelsListComponents(appLanguageState);
  }

  @override
  Widget build(BuildContext context) {
    final hotelModelsItems = ref.watch(hotelsListProvider);

    if (hotelModelsItems.data == null) {
      return const SizedBox.shrink();
    }

    final nearestDestinations = hotelModelsItems.data
        .where((dest) => dest.district == widget.destination.district)
        .toList();

    if (nearestDestinations.isEmpty) {
      return const EmptyListImage();
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        ListView.builder(
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: nearestDestinations.length,
          itemBuilder: (context, index) {
            final nearestDestination = nearestDestinations[index];
            return GestureDetector(
              onTap: () {
                navigateToSpotPage(nearestDestination.id);
              },
              child: Card(
                color: uiColors.scrim,
                elevation: 1,
                child: Padding(
                  padding: EdgeInsets.all(AppValues.dimen_10.r),
                  child: Row(
                    children: [
                      SizedBox(width: AppValues.dimen_10.w),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              nearestDestination.title,
                              style: appTextStyles.secondaryNovaRegular16,
                            ),
                            SizedBox(height: AppValues.dimen_10.w),
                            Text(
                              nearestDestination.district,
                              style: appTextStyles.secondaryNovaRegular12,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: AppValues.dimen_10.w),
                      ClipRRect(
                        borderRadius:
                            BorderRadius.circular(AppValues.dimen_10.r),
                        child: CachedNetworkImage(
                          imageUrl: nearestDestination.image,
                          width: AppValues.dimen_60.r,
                          height: AppValues.dimen_60.r,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  void navigateToSpotPage(String id) {
    final networkState = ref.watch(networkStatusProvider);
    if (networkState.value?.first != ConnectivityResult.none) {
      //context.pushNamed(AppRoutes.hotelScreen, extra: id);
    }
  }
}
