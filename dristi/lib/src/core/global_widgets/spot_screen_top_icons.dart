import 'package:dristi/src/core/base/base_consumer_stateful_widget.dart';
import 'package:dristi/src/core/constants/app_assets.dart';
import 'package:dristi/src/core/constants/app_values.dart';
import 'package:dristi/src/core/global_widgets/asset_image_view.dart';
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
                icon: Assets.back,
                color: uiColors.primary,
                onTap: () {
                  context.pop();
                },
              ),
              SizedBox(width: AppValues.dimen_10.w),
              _buildNavigationIcon(
                icon: Assets.home,
                color: uiColors.primary,
                onTap: () {
                  popUntilHome(context);
                },
              ),
            ],
          ),
          _buildNavigationIcon(
            icon: isFavorite ? Assets.heartFill : Assets.heartOutlined,
            color: uiColors.error,
            onTap: () {
              widget.onFavoriteToggle(widget.itemId);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildNavigationIcon({
    required String icon,
    required Color color,
    required Function()? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: AppValues.dimen_40.r,
        width: AppValues.dimen_40.r,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: uiColors.light,
        ),
        child: AssetImageView(
          fileName: icon,
          height: AppValues.dimen_20.r,
          width: AppValues.dimen_20.r,
          color: color,
        ),
      ),
    );
  }
}
