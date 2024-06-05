import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dristi/src/core/base/base_consumer_stateful_widget.dart';
import 'package:dristi/src/core/constants/app_assets.dart';
import 'package:dristi/src/core/constants/app_values.dart';
import 'package:dristi/src/core/global_providers/network_status/network_status_provider.dart';
import 'package:dristi/src/core/global_widgets/network_error_alert.dart';
import 'package:dristi/src/core/routes/app_routes.dart';
import 'package:dristi/src/core/utils/asset_image_view.dart';
import 'package:dristi/src/core/utils/localization_ext.dart';
import 'package:dristi/src/features/destinations/presentation/riverpod/destination_provider.dart';
import 'package:dristi/src/features/home/advertisements/domain/entity/advertisement_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class DestinationScreen extends ConsumerStatefulWidget {
  const DestinationScreen({super.key});

  @override
  ConsumerState createState() => _DestinationPageState();
}

class _DestinationPageState
    extends BaseConsumerStatefulWidget<DestinationScreen> {
  final TextEditingController _searchFieldController = TextEditingController();

  @override
  void initState() {
    super.initState();
    Future(() {
      _getDestinationComponents();
    });
  }

  Future<void> _getDestinationComponents() async {
    final state = ref.watch(networkStatusProvider);
    if (state.value?.first != ConnectivityResult.none) {
      ref.read(destinationProvider.notifier).getDestinationComponents();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: RefreshIndicator(
          onRefresh: _getDestinationComponents,
          child: CustomScrollView(
            slivers: [
              _buildSliverAppBar(),
              const SliverToBoxAdapter(
                child: NetworkErrorAlert(),
              ),
              _buildAdvertisement(),
              _buildDestinationsList(),
            ],
          ),
        ),
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

  Widget _buildAppBar() {
    ref.watch(destinationsSearchField);
    final searchFieldNotifier = ref.read(destinationsSearchField.notifier);

    return AppBar(
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back_ios,
        ),
        onPressed: () {
          context.pop();
        },
      ),
      title: TextField(
        controller: _searchFieldController,
        onChanged: (value) {
          searchFieldNotifier.state = value;
        },
        onTapOutside: (event) {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        cursorColor: uiColors.primary,
        style: appTextStyles.secondaryNovaRegular16,
        decoration: InputDecoration(
          hintText: context.localization.searchDestination,
          suffixIcon: _searchFieldController.text.isNotEmpty
              ? GestureDetector(
                  onTap: () {
                    _searchFieldController.clear();
                    searchFieldNotifier.state = '';
                  },
                  child: const Icon(Icons.clear),
                )
              : null,
        ),
      ),
      actions: [
        GestureDetector(
          onTap: () {},
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: AppValues.dimen_10.w),
            child: const Icon(Icons.more_vert),
          ),
        ),
      ],
    );
  }

  Widget _buildDestinationsList() {
    final destinationModelsState = ref.watch(destinationProvider);
    return destinationModelsState.data != null
        ? SliverPadding(
            padding: EdgeInsets.only(
              left: AppValues.dimen_8.r,
              right: AppValues.dimen_8.r,
              bottom: AppValues.dimen_16.r,
            ),
            sliver: SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: AppValues.dimen_80.w / AppValues.dimen_100.w,
              ),
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return _buildDestinationCard(index);
                },
                childCount: destinationModelsState.data.length,
              ),
            ),
          )
        : const SliverToBoxAdapter(
            child: SizedBox.shrink(),
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

  Widget _buildDestinationCard(int index) {
    return GestureDetector(
      onTap: navigateToSpotPage,
      child: Card(
        child: Stack(
          fit: StackFit.expand,
          children: [
            _buildImage(),
            _buildGradient(),
            _buildLabels(index),
          ],
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
            uiColors.shadow,
            uiColors.shadow.withOpacity(0.25),
            uiColors.transparent,
          ],
        ),
      ),
    );
  }

  Widget _buildLabels(int index) {
    final destinationModelsState = ref.watch(destinationProvider);
    final item = destinationModelsState.data[index];

    return Padding(
      padding: EdgeInsets.all(AppValues.dimen_10.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            item.title,
            style: appTextStyles.onImageNovaSemiBold16,
          ),
          Text(
            item.division,
            style: appTextStyles.onImageNovaRegular12,
          ),
        ],
      ),
    );
  }

  void navigateToWebView({required AdvertisementEntity item}) {
    context.pushNamed(AppRoutes.webView, extra: item);
  }

  void navigateToSpotPage() {
    context.pushNamed(AppRoutes.spot);
  }
}
