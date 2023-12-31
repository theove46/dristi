import 'package:dristi/src/core/assets/assets.dart';
import 'package:dristi/src/core/theme/colors.dart';
import 'package:dristi/src/core/theme/font_style.dart';
import 'package:dristi/src/core/utils/texts/text_constants.dart';
import 'package:dristi/src/features/districts/presentation/riverpod/district_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DistrictsPage extends ConsumerStatefulWidget {
  const DistrictsPage({super.key});

  @override
  ConsumerState createState() => _DistrictsPageState();
}

class _DistrictsPageState extends ConsumerState<DistrictsPage> {
  @override
  void initState() {
    super.initState();
    Future(() {
      ref.read(districtProvider.notifier).getDistrictComponents();
    });
  }

  @override
  Widget build(BuildContext context) {
    final districtModelsState = ref.watch(districtProvider);

    return Scaffold(
      backgroundColor: UIColors.white,
      appBar: AppBar(
        title: Text(
          TextConstants.allDistrictsBD,
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
      body: districtModelsState.data != null
          ? ListView.builder(
              itemCount: (districtModelsState.data.length / 2).ceil(),
              itemBuilder: (context, index) {
                final int startIndex = index * 2;
                final int endIndex = startIndex + 1;
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.sp),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildDistrictCard(startIndex),
                      if (endIndex < districtModelsState.data.length)
                        _buildDistrictCard(endIndex),
                    ],
                  ),
                );
              },
            )
          : Container(),
    );
  }

  Widget _buildDistrictCard(int index) {
    final districtModelsState = ref.watch(districtProvider);

    return Expanded(
      child: Card(
        elevation: 4,
        color: UIColors.white,
        margin: EdgeInsets.all(5.sp),
        shadowColor: UIColors.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.r),
            border: Border.all(
              color: UIColors.primary,
            ),
            image: const DecorationImage(
              image: AssetImage(Assets.forestCard),
              fit: BoxFit.contain,
              alignment: Alignment.bottomRight,
              opacity: 0.15,
              //repeat: ImageRepeat.repeat,
            ),
          ),
          child: ListTile(
            title: Text(
              districtModelsState.data[index].title,
              // district.title,
              style: AppTypography.semiBold16Nova(
                color: UIColors.primary,
              ),
            ),
            subtitle: Text(
              districtModelsState.data[index].division,
              // district.division,
              style: AppTypography.regular10Nova(
                color: UIColors.primary,
              ),
            ),
            onTap: () {},
          ),
        ),
      ),
    );
  }
}
