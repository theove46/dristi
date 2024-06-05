import 'package:dristi/src/core/base/base_consumer_stateful_widget.dart';
import 'package:dristi/src/core/constants/app_assets.dart';
import 'package:dristi/src/core/constants/app_values.dart';
import 'package:dristi/src/core/routes/app_routes.dart';
import 'package:dristi/src/core/utils/localization_ext.dart';
import 'package:dristi/src/features/districts/presentation/riverpod/district_provider.dart';
import 'package:dristi/src/features/home/advertisements/domain/entity/advertisement_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class DistrictsScreen extends ConsumerStatefulWidget {
  const DistrictsScreen({super.key});

  @override
  ConsumerState createState() => _DistrictsPageState();
}

class _DistrictsPageState extends BaseConsumerStatefulWidget<DistrictsScreen> {
  final TextEditingController _searchFieldController = TextEditingController();

  @override
  void initState() {
    super.initState();
    Future(() {
      ref.read(districtProvider.notifier).getDistrictComponents(searchKey: '');
    });
  }

  @override
  void dispose() {
    _searchFieldController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _buildSliverAppBar(),
          _buildAdvertisement(),
          _buildDistrictsList(),
        ],
      ),
    );
  }

  Widget _buildSliverAppBar() {
    return SliverAppBar(
      floating: true,
      flexibleSpace: FlexibleSpaceBar(
        background: _buildAppBar(),
      ),
      automaticallyImplyLeading: false,
      expandedHeight: AppValues.dimen_70.h,
    );
  }

  AppBar _buildAppBar() {
    ref.watch(districtsSearchField);
    final searchFieldNotifier = ref.read(districtsSearchField.notifier);

    return AppBar(
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back_ios,
        ),
        onPressed: () {
          context.pop();
        },
      ),
      title: Padding(
        padding: EdgeInsets.only(
          right: AppValues.dimen_24.r,
        ),
        child: TextField(
          controller: _searchFieldController,
          onChanged: (value) {
            searchFieldNotifier.state = value;
            ref
                .read(districtProvider.notifier)
                .getDistrictComponents(searchKey: value);
          },
          onTapOutside: (event) {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          cursorColor: uiColors.primary,
          style: appTextStyles.secondaryNovaRegular16,
          decoration: InputDecoration(
            hintText: context.localization.searchDistricts,
            suffixIcon: _searchFieldController.text.isNotEmpty
                ? GestureDetector(
                    onTap: () {
                      _searchFieldController.clear();
                      searchFieldNotifier.state = '';
                      ref
                          .read(districtProvider.notifier)
                          .getDistrictComponents(searchKey: '');
                    },
                    child: const Icon(Icons.clear),
                  )
                : null,
          ),
        ),
      ),
    );
  }

  Widget _buildAdvertisement() {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.only(
          left: AppValues.dimen_16.r,
          right: AppValues.dimen_16.r,
          bottom: AppValues.dimen_10.r,
        ),
        child: GestureDetector(
          onTap: () {
            navigateToWebView(item: AdvertisementEntity.initial());
          },
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                height: AppValues.dimen_60.r,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppValues.dimen_16.r),
                  color: uiColors.background,
                  image: const DecorationImage(
                    image: AssetImage(Assets.advertiseBanner),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: EdgeInsets.only(right: AppValues.dimen_20.w),
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: AppValues.dimen_8.r,
                      vertical: AppValues.dimen_8.r,
                    ),
                    decoration: BoxDecoration(
                      color: uiColors.shadow.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(
                        AppValues.dimen_10.r,
                      ),
                    ),
                    child: Text(
                      context.localization.visitNow,
                      style: appTextStyles.onImageNovaRegular12,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDistrictsList() {
    final districtModelsState = ref.watch(districtProvider);

    return districtModelsState.data != null
        ? SliverPadding(
            padding: EdgeInsets.only(
              left: AppValues.dimen_8.r,
              right: AppValues.dimen_8.r,
              bottom: AppValues.dimen_16.r,
            ),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final int startIndex = index * 2;
                  final int endIndex = startIndex + 1;
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildDistrictCard(startIndex),
                      if (endIndex < districtModelsState.data.length)
                        _buildDistrictCard(endIndex),
                    ],
                  );
                },
                childCount: (districtModelsState.data.length / 2).ceil(),
              ),
            ),
          )
        : const SliverToBoxAdapter(
            child: SizedBox.shrink(),
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
            color: uiColors.background,
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
              style: appTextStyles.secondaryNovaRegular12,
            ),
            onTap: () {
              navigateToDestinationsPage();
            },
          ),
        ),
      ),
    );
  }

  void navigateToWebView({required AdvertisementEntity item}) {
    context.pushNamed(AppRoutes.webView, extra: item);
  }

  void navigateToDestinationsPage() {
    context.pushNamed(AppRoutes.destination);
  }
}
