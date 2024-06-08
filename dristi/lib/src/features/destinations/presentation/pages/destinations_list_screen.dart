import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dristi/src/core/base/base_consumer_stateful_widget.dart';
import 'package:dristi/src/core/constants/app_values.dart';
import 'package:dristi/src/core/global_providers/network_status/network_status_provider.dart';
import 'package:dristi/src/core/global_widgets/advertisement_image.dart';
import 'package:dristi/src/core/global_widgets/network_error_alert.dart';
import 'package:dristi/src/features/destinations/presentation/riverpod/destination_provider.dart';
import 'package:dristi/src/features/destinations/presentation/widgets/destinations_app_bar.dart';
import 'package:dristi/src/features/destinations/presentation/widgets/destinations_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DestinationScreen extends ConsumerStatefulWidget {
  const DestinationScreen({super.key});

  @override
  ConsumerState createState() => _DestinationPageState();
}

class _DestinationPageState
    extends BaseConsumerStatefulWidget<DestinationScreen> {
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
          child: const CustomScrollView(
            slivers: [
              DestinationsAppBar(),
              SliverToBoxAdapter(
                child: NetworkErrorAlert(),
              ),
              // _buildAdvertisement(), // For Future Usage
              DestinationsList(),
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
