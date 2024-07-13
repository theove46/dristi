import 'package:dristi/src/core/base/base_consumer_stateful_widget.dart';
import 'package:dristi/src/core/constants/app_values.dart';
import 'package:dristi/src/core/global_entity/global_entity.dart';
import 'package:dristi/src/core/global_providers/language_settings/language_settings_provider.dart';
import 'package:dristi/src/core/global_widgets/advertisement_image.dart';
import 'package:dristi/src/core/global_widgets/shimmers.dart';
import 'package:dristi/src/core/routes/app_routes.dart';
import 'package:dristi/src/core/utils/localization_ext.dart';
import 'package:dristi/src/features/destination/domain/entities/destination_entities.dart';
import 'package:dristi/src/features/home/home_screen/riverpod/home_provider.dart';
import 'package:dristi/src/features/hotel/presentation/riverpod/hotel_data/hotel_provider.dart';
import 'package:dristi/src/features/hotel/presentation/widgets/hotel_details_builder.dart';
import 'package:dristi/src/features/hotel/presentation/widgets/hotel_image.dart';
import 'package:dristi/src/features/hotel/presentation/widgets/hotel_top_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class HotelScreen extends ConsumerStatefulWidget {
  const HotelScreen({
    required this.id,
    required this.instanceId,
    super.key,
  });

  final String id;
  final String instanceId;

  @override
  ConsumerState createState() => _HotelScreenState();
}

class _HotelScreenState extends BaseConsumerStatefulWidget<HotelScreen> {
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
    ref.read(hotelProvider.notifier).getHotelData(
          appLanguageState,
          widget.id,
        );
    ref
        .read(singleAdvertisementProvider.notifier)
        .getSingleAdvertisementComponents();
  }

  @override
  Widget build(BuildContext context) {
    final hotelDataState = ref.watch(hotelProvider);

    if (hotelDataState.data == null) {
      return buildFullViewShimmer(context);
    }

    return Scaffold(
      body: Stack(
        children: [
          HotelImage(
            hotel: hotelDataState.data,
          ),
          _buildDescription(),
          HotelScreenTopIcons(
            hotelId: widget.id,
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
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              navigateToGallery();
            },
            child: Container(
              height: AppValues.dimen_480.h,
            ),
          ),
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
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AdvertisementImage(),
                  HotelScreenDetailsBuilder(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void navigateToGallery() {
    final hotelDataState = ref.watch(hotelProvider);
    final List<ImagesEntity> images = hotelDataState.data.images ?? [];
    context.pushNamed(
      AppRoutes.gallery,
      extra: GalleryScreenEntity(
        galleryName: hotelDataState.data.title,
        images: images,
      ),
    );
  }
}