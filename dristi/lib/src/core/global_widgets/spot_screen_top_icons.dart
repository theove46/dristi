import 'package:dristi/src/core/base/base_consumer_stateful_widget.dart';
import 'package:dristi/src/core/constants/app_values.dart';
import 'package:dristi/src/core/routes/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class SpotScreenTopIcons extends ConsumerStatefulWidget {
  const SpotScreenTopIcons({
    required this.itemId,
    required this.isFavoriteProvider,
    required this.onFavoriteToggle,
    super.key,
  });

  final String itemId;
  final bool Function(String) isFavoriteProvider;
  final void Function(String) onFavoriteToggle;

  @override
  ConsumerState createState() => _SpotScreenTopIconsState();
}

class _SpotScreenTopIconsState
    extends BaseConsumerStatefulWidget<SpotScreenTopIcons> {
  @override
  Widget build(BuildContext context) {
    final isFavorite = widget.isFavoriteProvider(widget.itemId);

    return Positioned(
      top: AppValues.dimen_40.r,
      left: AppValues.dimen_10.r,
      right: AppValues.dimen_10.r,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              _buildNavigationIcon(
                icon: Padding(
                  padding: EdgeInsets.only(left: AppValues.dimen_6.w),
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: uiColors.primary,
                    size: AppValues.dimen_20.r,
                  ),
                ),
                onTap: () {
                  context.pop();
                },
              ),
              SizedBox(width: AppValues.dimen_10.w),
              _buildNavigationIcon(
                icon: Icon(
                  Icons.home_rounded,
                  color: uiColors.primary,
                  size: AppValues.dimen_20.r,
                ),
                onTap: () {
                  popUntilHome(context);
                },
              ),
            ],
          ),
          _buildNavigationIcon(
            icon: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border_outlined,
              color: uiColors.error,
              size: AppValues.dimen_20.r,
            ),
            onTap: () {
              widget.onFavoriteToggle(widget.itemId);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildNavigationIcon(
      {required Widget icon, required Function()? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: AppValues.dimen_40.r,
        width: AppValues.dimen_40.r,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: uiColors.light,
        ),
        child: Center(child: icon),
      ),
    );
  }
}
