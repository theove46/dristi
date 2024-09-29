import 'package:dristi/src/core/base/base_consumer_stateful_widget.dart';
import 'package:dristi/src/core/constants/app_assets.dart';
import 'package:dristi/src/core/constants/app_values.dart';
import 'package:dristi/src/core/global_providers/bottom_nav_bar_providers/bottom_nav_bar_providers.dart';
import 'package:dristi/src/core/global_widgets/asset_image_view.dart';
import 'package:dristi/src/core/utils/enums.dart';
import 'package:dristi/src/features/home/home_screen/pages/home_screen.dart';
import 'package:dristi/src/features/settings/presentation/pages/settings_screen.dart';
import 'package:dristi/src/features/travelling/presentation/pages/travelling_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomNavigation extends ConsumerStatefulWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  ConsumerState createState() => _BottomNavigationState();
}

class _BottomNavigationState
    extends BaseConsumerStatefulWidget<BottomNavigation>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;

  final Map<BottomNavItems, Widget> _widgetOptions = {
    BottomNavItems.home: const HomeScreen(),
    BottomNavItems.travelling: const TravellingScreen(),
    BottomNavItems.settings: const SettingsScreen(),
  };

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bottomNavBarState = ref.watch(bottomNavBarProvider);

    return Scaffold(
      body: IndexedStack(
        index: bottomNavBarState.index,
        children: _widgetOptions.values.toList(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          _buildBottomNavigationBarItem(
            Assets.home,
            BottomNavItems.home,
          ),
          _buildBottomNavigationBarItem(
            Assets.travelling,
            BottomNavItems.travelling,
          ),
          _buildBottomNavigationBarItem(
            Assets.settings,
            BottomNavItems.settings,
          ),
        ],
        backgroundColor: uiColors.background,
        currentIndex: bottomNavBarState.index,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: (index) => _onItemTapped(BottomNavItems.values[index]),
      ),
    );
  }

  BottomNavigationBarItem _buildBottomNavigationBarItem(
      String icon, BottomNavItems item) {
    final bottomNavBarState = ref.watch(bottomNavBarProvider);

    return BottomNavigationBarItem(
      icon: AssetImageView(
        fileName: icon,
        fit: BoxFit.cover,
        height: AppValues.dimen_28.r,
        width: AppValues.dimen_28.r,
        color: bottomNavBarState == item ? uiColors.primary : uiColors.tertiary,
      ),
      label: bottomNavBarState.name,
    );
  }

  void _onItemTapped(BottomNavItems item) {
    final bottomNavBarNotifier = ref.read(bottomNavBarProvider.notifier);
    bottomNavBarNotifier.state = item;
    _animationController.forward(from: 0);
  }
}
