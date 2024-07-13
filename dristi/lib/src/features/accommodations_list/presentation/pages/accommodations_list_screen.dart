import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dristi/src/core/base/base_consumer_stateful_widget.dart';
import 'package:dristi/src/core/constants/app_values.dart';
import 'package:dristi/src/core/global_providers/favourites_items/favourites_items_provider.dart';
import 'package:dristi/src/core/global_providers/language_settings/language_settings_provider.dart';
import 'package:dristi/src/core/global_providers/network_status/network_status_provider.dart';
import 'package:dristi/src/core/global_widgets/advertisement_image.dart';
import 'package:dristi/src/core/global_widgets/network_error_alert.dart';
import 'package:dristi/src/core/utils/localization_ext.dart';
import 'package:dristi/src/features/accommodations_list/presentation/riverpod/accommodations_list_provider.dart';
import 'package:dristi/src/features/accommodations_list/presentation/widgets/accommodations_list_filtered_row.dart';
import 'package:dristi/src/features/accommodations_list/presentation/widgets/accommodations_list_app_bar.dart';
import 'package:dristi/src/features/accommodations_list/presentation/widgets/accommodations_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AccommodationsListScreen extends ConsumerStatefulWidget {
  const AccommodationsListScreen({
    super.key,
  });

  @override
  ConsumerState createState() => _AccommodationsListScreenState();
}

class _AccommodationsListScreenState
    extends BaseConsumerStatefulWidget<AccommodationsListScreen> {
  @override
  void initState() {
    super.initState();
    Future(() {
      _getHotelsListComponents();
      ref.read(savedItemsProvider.notifier).loadSavedItems();
    });
  }

  Future<void> _getHotelsListComponents() async {
    final appLanguageState =
        ref.watch(languageProvider).language.toLanguage.languageCode;
    final networkState = ref.watch(networkStatusProvider);

    if (networkState.value?.first != ConnectivityResult.none) {
      ref
          .read(accommodationsListProvider.notifier)
          .getAccommodationsListComponents(appLanguageState);
    }

    final accommodationsListState = ref.watch(accommodationsListDistrictField);
    if (accommodationsListState.isNotEmpty) {
      accommodationsController.text = accommodationsListState;
    }
  }

  final TextEditingController searchFieldController = TextEditingController();
  final TextEditingController accommodationsController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: RefreshIndicator(
          onRefresh: _getHotelsListComponents,
          child: CustomScrollView(
            slivers: [
              AccommodationsListScreenAppBar(
                searchFieldController: searchFieldController,
                accommodationsController: accommodationsController,
              ),
              const SliverToBoxAdapter(
                child: NetworkErrorAlert(),
              ),
              AccommodationsListScreenFilteredRow(
                accommodationsController: accommodationsController,
              ),
              // _buildAdvertisement(), // For Future Usage
              const AccommodationsList(),
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
