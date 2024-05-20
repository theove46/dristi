import 'package:dristi/src/core/assets/assets.dart';
import 'package:dristi/src/core/constants/app_values.dart';
import 'package:dristi/src/core/services/routes/app_routes.dart';
import 'package:dristi/src/core/theme/colors.dart';
import 'package:dristi/src/core/theme/text_styles.dart';
import 'package:dristi/src/core/utils/asset_image_view.dart';
import 'package:dristi/src/features/destinations/presentation/riverpod/destination_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class DestinationScreen extends ConsumerStatefulWidget {
  const DestinationScreen({super.key});

  @override
  ConsumerState createState() => _DestinationPageState();
}

class _DestinationPageState extends ConsumerState<DestinationScreen> {
  @override
  void initState() {
    super.initState();
    Future(() {
      ref.read(destinationProvider.notifier).getDestinationComponents();
    });
  }

  @override
  Widget build(BuildContext context) {
    final destinationModelsState = ref.watch(destinationProvider);

    return Scaffold(
      backgroundColor: UIColors.white,
      appBar: AppBar(
        title: Text(
          "Top Destination *** ***",
          style: primaryNovaBold16,
        ),
        centerTitle: false,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: UIColors.primary,
          ),
          onPressed: () {
            context.pop();
          },
        ),
      ),
      body: destinationModelsState.data != null
          ? GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: AppValues.dimen_80.w / AppValues.dimen_100.w,
              ),
              itemCount: destinationModelsState.data.length,
              itemBuilder: (context, index) {
                return _buildDestinationCard(index);
              },
            )
          : Container(),
    );
  }

  Widget _buildDestinationCard(int index) {
    return GestureDetector(
      onTap: navigateToSpotPage,
      child: Expanded(
        child: Card(
          elevation: 4,
          color: UIColors.white,
          margin: EdgeInsets.all(AppValues.dimen_8.r),
          shadowColor: UIColors.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppValues.dimen_16.r),
          ),
          child: Stack(
            fit: StackFit.expand,
            children: [
              _buildImage(),
              _buildGradient(),
              _buildLabels(index),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImage() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppValues.dimen_16.r),
        border: Border.all(
          width: 0,
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(AppValues.dimen_16.r),
        child: const AssetImageView(
          fileName: Assets.nilgiri,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildGradient() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppValues.dimen_16.r),
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          tileMode: TileMode.clamp,
          colors: [
            UIColors.black,
            UIColors.black.withOpacity(0.2),
            UIColors.transparent,
          ],
        ),
      ),
    );
  }

  Widget _buildLabels(int index) {
    final destinationModelsState = ref.watch(destinationProvider);
    final item = destinationModelsState.data[index];

    return Padding(
      padding: EdgeInsets.all(AppValues.dimen_16.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            item.title,
            style: whiteNovaSemiBold16,
          ),
          Text(
            item.division,
            style: whiteNovaRegular10,
          ),
        ],
      ),
    );
  }

  void navigateToSpotPage() {
    Navigator.pushNamed(
      context,
      AppRoutes.spot,
    );
  }
}
