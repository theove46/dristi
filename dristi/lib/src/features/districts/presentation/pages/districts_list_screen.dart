import 'package:dristi/src/core/base/base_consumer_stateful_widget.dart';
import 'package:dristi/src/core/constants/app_assets.dart';
import 'package:dristi/src/core/constants/app_values.dart';
import 'package:dristi/src/core/utils/localization_ext.dart';
import 'package:dristi/src/features/districts/presentation/riverpod/district_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DistrictsScreen extends ConsumerStatefulWidget {
  const DistrictsScreen({super.key});

  @override
  ConsumerState createState() => _DistrictsPageState();
}

class _DistrictsPageState extends BaseConsumerStatefulWidget<DistrictsScreen> {
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
      appBar: AppBar(
        title: Text(
          context.localization.allDistrictsBD,
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
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
                  padding: EdgeInsets.symmetric(
                    horizontal: AppValues.dimen_16.w,
                  ),
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
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppValues.dimen_16.r),
            border: Border.all(
              color: uiColors.primary,
            ),
            image: const DecorationImage(
              image: AssetImage(Assets.forestCard),
              fit: BoxFit.contain,
              alignment: Alignment.bottomRight,
              opacity: 0.30,
            ),
          ),
          child: ListTile(
            title: Text(
              item.title,
              style: appTextStyles.primaryNovaSemiBold16,
            ),
            subtitle: Text(
              item.division,
              style: appTextStyles.primaryNovaRegular12,
            ),
            onTap: () {},
          ),
        ),
      ),
    );
  }
}
