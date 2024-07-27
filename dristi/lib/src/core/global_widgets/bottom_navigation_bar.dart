import 'package:dristi/src/core/base/base_consumer_stateful_widget.dart';
import 'package:dristi/src/core/constants/app_values.dart';
import 'package:dristi/src/core/global_providers/bottom_nav_bar_providers/bottom_nav_bar_providers.dart';
import 'package:dristi/src/core/utils/enums.dart';
import 'package:dristi/src/features/destinations_list/presentation/pages/destinations_list_screen.dart';
import 'package:dristi/src/features/home/home_screen/pages/home_screen.dart';
import 'package:dristi/src/features/settings/presentation/pages/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_material_symbols/flutter_material_symbols.dart';
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
  final PageController _pageController = PageController();
  late final AnimationController _animationController;

  final Map<BottomNavItems, Widget> _widgetOptions = {
    BottomNavItems.home: const HomeScreen(),
    BottomNavItems.destinations: const DestinationsListScreen(),
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
    _pageController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bottomNavBarState = ref.watch(bottomNavBarProvider);
    final bottomNavBarNotifier = ref.read(bottomNavBarProvider.notifier);

    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: _widgetOptions.values.toList(),
        onPageChanged: (index) {
          bottomNavBarNotifier.state = BottomNavItems.values[index];
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          _buildBottomNavigationBarItem(
            MaterialSymbols.home_filled,
            BottomNavItems.home,
          ),
          _buildBottomNavigationBarItem(
            MaterialSymbols.location_on_filled,
            BottomNavItems.destinations,
          ),
          _buildBottomNavigationBarItem(
            MaterialSymbols.settings_filled,
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
      IconData icon, BottomNavItems item) {
    final bottomNavBarState = ref.watch(bottomNavBarProvider);

    return BottomNavigationBarItem(
      icon: Icon(
        icon,
        size: AppValues.dimen_32.r,
        color: bottomNavBarState == item ? uiColors.primary : uiColors.tertiary,
      ),
      label: bottomNavBarState.name,
    );
  }

  void _onItemTapped(BottomNavItems item) {
    final bottomNavBarNotifier = ref.read(bottomNavBarProvider.notifier);
    bottomNavBarNotifier.state = item;
    _pageController.jumpToPage(item.index);
    _animationController.forward(from: 0);
  }
}
