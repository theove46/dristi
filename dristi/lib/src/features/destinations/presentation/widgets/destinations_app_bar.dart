import 'package:dristi/src/core/base/base_consumer_stateful_widget.dart';
import 'package:dristi/src/core/constants/app_values.dart';
import 'package:dristi/src/core/utils/localization_ext.dart';
import 'package:dristi/src/features/destinations/presentation/riverpod/destination_provider.dart';
import 'package:dristi/src/features/destinations/presentation/widgets/filtered_bottom_sheet.dart';
import 'package:dristi/src/features/districts/presentation/riverpod/district_provider.dart';
import 'package:dristi/src/features/home/categories/presentations/riverpod/categories_state.dart';
import 'package:dristi/src/features/home/home_screen/riverpod/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class DestinationsAppBar extends ConsumerStatefulWidget {
  const DestinationsAppBar({super.key});

  @override
  ConsumerState createState() => _DestinationsAppBarState();
}

class _DestinationsAppBarState
    extends BaseConsumerStatefulWidget<DestinationsAppBar> {
  final TextEditingController _searchFieldController = TextEditingController();
  final TextEditingController _categoryController = TextEditingController();
  final TextEditingController _districtController = TextEditingController();

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
    ref.watch(destinationsSearchField);
    ref.watch(destinationsCategoryField);
    ref.watch(destinationsDistrictField);
    final searchFieldNotifier = ref.read(destinationsSearchField.notifier);
    final categoryFieldNotifier = ref.read(destinationsCategoryField.notifier);
    final districtFieldNotifier = ref.read(destinationsDistrictField.notifier);

    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios),
        onPressed: () {
          searchFieldNotifier.state = '';
          categoryFieldNotifier.state = '';
          districtFieldNotifier.state = '';
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
        _buildAppBarAction(),
      ],
    );
  }

  Widget _buildAppBarAction() {
    return PopupMenuButton<String>(
      icon: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppValues.dimen_10.w),
        child: const Icon(Icons.tune),
      ),
      itemBuilder: (context) => [
        _buildMenuItem(
          controller: _categoryController,
          hintText: context.localization.selectCategory,
          onTap: () {
            _showCategoryFilter();
          },
        ),
        _buildMenuItem(
          controller: _districtController,
          hintText: context.localization.selectDistrict,
          onTap: () {
            _showDistrictFilter();
          },
        ),
      ],
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

  void _showCategoryFilter() {
    final categoryFieldNotifier = ref.read(destinationsCategoryField.notifier);
    final categoriesItems = ref.read(categoriesProvider);

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        if (categoriesItems.status != CategoriesStatus.success ||
            categoriesItems.data == null) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        return FilteredBottomSheet(
          items: categoriesItems.data,
          notifier: categoryFieldNotifier,
          controller: _categoryController,
          text: context.localization.selectCategory,
          type: FilterType.category,
        );
      },
    );
  }

  void _showDistrictFilter() {
    final districtFieldNotifier = ref.read(destinationsDistrictField.notifier);
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
          controller: _districtController,
          text: context.localization.selectDistrict,
          type: FilterType.district,
        );
      },
    );
  }
}

enum FilterType {
  category,
  district,
}
