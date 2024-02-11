import 'package:dristi/src/core/assets/assets.dart';
import 'package:dristi/src/core/services/routes/routes.dart';
import 'package:dristi/src/core/theme/colors.dart';
import 'package:dristi/src/core/theme/font_style.dart';
import 'package:dristi/src/features/destinations/presentation/riverpod/destination_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DestinationPage extends ConsumerStatefulWidget {
  const DestinationPage({super.key});

  @override
  ConsumerState createState() => _DestinationPageState();
}

class _DestinationPageState extends ConsumerState<DestinationPage> {
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
          style: AppTypography.bold16Nova(
            color: UIColors.primary,
          ),
        ),
        centerTitle: false,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: UIColors.primary, // Change the color here
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: destinationModelsState.data != null
          ? GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 80.sp / 100.sp,
              ),
              itemCount: destinationModelsState.data.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.all(8.sp),
                  child: _buildDestinationCard(index),
                );
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
          margin: EdgeInsets.all(5.sp),
          shadowColor: UIColors.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.r),
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
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          width: 0,
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.r),
        child: Image.asset(
          Assets.nilgiri,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildGradient() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
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
      padding: EdgeInsets.all(10.sp),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            item.title,
            style: AppTypography.semiBold16Nova(
              color: UIColors.white,
            ),
          ),
          Text(
            item.division,
            style: AppTypography.regular10Nova(
              color: UIColors.white,
            ),
          ),
        ],
      ),
    );
  }

  void navigateToSpotPage() {
    Navigator.pushNamed(
      context,
      Routes.spot,
    );
  }
}
