import 'package:dristi/src/core/assets/assets.dart';
import 'package:dristi/src/core/constants/app_values.dart';
import 'package:dristi/src/core/theme/colors.dart';
import 'package:dristi/src/core/constants/text_constants.dart';
import 'package:dristi/src/core/theme/text_styles.dart';
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
          style: primaryNovaBold16,
        ),
        centerTitle: false,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: UIColors.primary,
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
                  padding:
                      EdgeInsets.symmetric(horizontal: AppValues.dimen_16.w),
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
    final item = districtModelsState.data[index];

    return Expanded(
      child: Card(
        elevation: 4,
        color: UIColors.white,
        margin: EdgeInsets.all(AppValues.dimen_5.r),
        shadowColor: UIColors.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppValues.dimen_16.r),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppValues.dimen_16.r),
            border: Border.all(
              color: UIColors.primary,
            ),
            image: const DecorationImage(
              image: AssetImage(Assets.forestCard),
              fit: BoxFit.contain,
              alignment: Alignment.bottomRight,
              opacity: 0.15,
            ),
          ),
          child: ListTile(
            title: Text(
              item.title,
              style: primaryNovaSemiBold16,
            ),
            subtitle: Text(
              item.division,
              style: primaryNovaRegular10,
            ),
            onTap: () {},
          ),
        ),
      ),
    );
  }
}
