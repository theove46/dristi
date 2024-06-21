import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dristi/src/core/base/base_consumer_stateful_widget.dart';
import 'package:dristi/src/core/constants/app_values.dart';
import 'package:dristi/src/core/global_providers/favourite_places/favourites_provider.dart';
import 'package:dristi/src/core/global_providers/language_settings/language_settings_provider.dart';
import 'package:dristi/src/core/global_providers/network_status/network_status_provider.dart';
import 'package:dristi/src/core/global_widgets/advertisement_image.dart';
import 'package:dristi/src/core/global_widgets/network_error_alert.dart';
import 'package:dristi/src/core/utils/localization_ext.dart';
import 'package:dristi/src/features/destinations/presentation/riverpod/destination_provider.dart';
import 'package:dristi/src/features/destinations/presentation/widgets/destinations_app_bar.dart';
import 'package:dristi/src/features/destinations/presentation/widgets/destinations_list.dart';
import 'package:dristi/src/features/destinations/presentation/widgets/filtered_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DestinationScreen extends ConsumerStatefulWidget {
  const DestinationScreen({
    this.isShowFavouritesList,
    super.key,
  });

  final bool? isShowFavouritesList;

  @override
  ConsumerState createState() => _DestinationScreenState();
}

class _DestinationScreenState
    extends BaseConsumerStatefulWidget<DestinationScreen> {
  @override
  void initState() {
    super.initState();
    Future(() {
      _getDestinationComponents();
      ref.read(favoritesProvider.notifier).loadFavorites();
    });
  }

  Future<void> _getDestinationComponents() async {
    final appLanguageState =
        ref.watch(languageProvider).language.toLanguage.languageCode;
    final networkState = ref.watch(networkStatusProvider);

    if (networkState.value?.first != ConnectivityResult.none) {
      ref
          .read(destinationProvider.notifier)
          .getDestinationComponents(appLanguageState);
    }

    final categoryState = ref.watch(destinationsCategoryField);
    if (categoryState.isNotEmpty) {
      categoryController.text = categoryState;
    }

    final districtState = ref.watch(destinationsDistrictField);
    if (districtState.isNotEmpty) {
      districtController.text = districtState;
    }
  }

  final TextEditingController searchFieldController = TextEditingController();
  final TextEditingController categoryController = TextEditingController();
  final TextEditingController districtController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: RefreshIndicator(
          onRefresh: _getDestinationComponents,
          child: CustomScrollView(
            slivers: [
              DestinationsAppBar(
                searchFieldController: searchFieldController,
                categoryController: categoryController,
                districtController: districtController,
              ),
              const SliverToBoxAdapter(
                child: NetworkErrorAlert(),
              ),
              FilteredRow(
                categoryController: categoryController,
                districtController: districtController,
                isShowFavouritesList: widget.isShowFavouritesList,
              ),
              // _buildAdvertisement(), // For Future Usage
              DestinationsList(
                isShowFavouritesList: widget.isShowFavouritesList,
              ),
            ],
          ),
        ),
      ),
    );
  }

  // For Future Usage
  // ignore: unused_element
  Widget _buildAdvertisement() {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.only(
          left: AppValues.dimen_16.r,
          right: AppValues.dimen_16.r,
          bottom: AppValues.dimen_10.r,
        ),
        child: const AdvertisementImage(),
      ),
    );
  }
}
