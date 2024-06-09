import 'package:dristi/src/core/base/base_consumer_stateful_widget.dart';
import 'package:dristi/src/core/constants/app_values.dart';
import 'package:dristi/src/core/utils/localization_ext.dart';
import 'package:dristi/src/features/districts/presentation/riverpod/district_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class DistrictsAppBar extends ConsumerStatefulWidget {
  const DistrictsAppBar({super.key});

  @override
  ConsumerState createState() => _DistrictsAppBarState();
}

class _DistrictsAppBarState
    extends BaseConsumerStatefulWidget<DistrictsAppBar> {
  final TextEditingController _searchFieldController = TextEditingController();
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
                    },
                    child: const Icon(Icons.clear),
                  )
                : null,
          ),
        ),
      ),
    );
  }
}
