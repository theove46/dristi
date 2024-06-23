import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dristi/l10n/localizations.dart';
import 'package:dristi/src/core/base/base_consumer_stateful_widget.dart';
import 'package:dristi/src/core/constants/app_values.dart';
import 'package:dristi/src/core/global_providers/network_status/network_status_provider.dart';
import 'package:dristi/src/core/utils/localization_ext.dart';
import 'package:dristi/src/features/hotels_list/presentation/riverpod/hotels_list_provider.dart';
import 'package:dristi/src/features/hotels_list/presentation/widgets/hotels_list_filtered_bottom_sheet.dart';
import 'package:dristi/src/features/districts/presentation/riverpod/district_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class HotelsAppBar extends ConsumerStatefulWidget {
  const HotelsAppBar({
    required this.searchFieldController,
    required this.categoryController,
    required this.districtController,
    super.key,
  });

  final TextEditingController searchFieldController;
  final TextEditingController categoryController;
  final TextEditingController districtController;

  @override
  ConsumerState createState() => _HotelsAppBarState();
}

class _HotelsAppBarState extends BaseConsumerStatefulWidget<HotelsAppBar> {
  @override
  Widget build(BuildContext context) {
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
    ref.watch(hotelsListSearchField);
    ref.watch(hotelsListDistrictField);
    final searchFieldNotifier = ref.read(hotelsListSearchField.notifier);
    final districtFieldNotifier = ref.read(hotelsListDistrictField.notifier);

    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios),
        onPressed: () {
          searchFieldNotifier.state = '';
          districtFieldNotifier.state = '';
          context.pop();
        },
      ),
      title: TextField(
        controller: widget.searchFieldController,
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
          suffixIcon: widget.searchFieldController.text.isNotEmpty
              ? GestureDetector(
                  onTap: () {
                    widget.searchFieldController.clear();
                    searchFieldNotifier.state = '';
                  },
                  child: const Icon(Icons.clear),
                )
              : null,
        ),
      ),
      actions: [
        _buildAppBarAction(),
      ],
    );
  }

  Widget _buildAppBarAction() {
    final networkState = ref.watch(networkStatusProvider);

    if (networkState.value?.first != ConnectivityResult.none) {}
    return PopupMenuButton<String>(
      icon: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppValues.dimen_10.w),
        child: const Icon(Icons.tune),
      ),
      itemBuilder: (context) =>
          networkState.value?.first != ConnectivityResult.none
              ? [
                  _buildMenuItem(
                    controller: widget.districtController,
                    hintText: context.localization.selectDistrict,
                    onTap: () {
                      _showDistrictFilter();
                    },
                  ),
                ]
              : [],
    );
  }

  PopupMenuItem<String> _buildMenuItem({
    required TextEditingController controller,
    required String hintText,
    required VoidCallback onTap,
  }) {
    return PopupMenuItem(
      padding: EdgeInsets.all(AppValues.dimen_10.r),
      child: TextField(
        controller: controller,
        readOnly: true,
        style: appTextStyles.secondaryNovaRegular12,
        decoration: InputDecoration(
          hintText: hintText,
          suffixIcon: GestureDetector(
            onTap: onTap,
            child: Icon(
              Icons.arrow_drop_down_outlined,
              size: AppValues.dimen_24.r,
            ),
          ),
        ),
      ),
    );
  }

  void _showDistrictFilter() {
    final districtFieldNotifier = ref.read(hotelsListDistrictField.notifier);
    final districtsItems = ref.read(districtProvider);

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        if (districtsItems.data == null) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        return FilteredBottomSheet(
          items: districtsItems.data,
          notifier: districtFieldNotifier,
          controller: widget.districtController,
          text: context.localization.selectDistrict,
          type: DestinationFilters.district,
        );
      },
    );
  }
}
