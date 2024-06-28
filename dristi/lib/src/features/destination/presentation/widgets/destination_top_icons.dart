import 'package:dristi/src/core/base/base_consumer_stateful_widget.dart';
import 'package:dristi/src/core/constants/app_values.dart';
import 'package:dristi/src/core/global_providers/favourite_places/favourites_provider.dart';
import 'package:dristi/src/core/routes/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class DestinationScreenTopIcons extends ConsumerStatefulWidget {
  const DestinationScreenTopIcons({
    required this.destinationId,
    super.key,
  });

  final String destinationId;

  @override
  ConsumerState createState() => _DestinationScreenTopIconsState();
}

class _DestinationScreenTopIconsState
    extends BaseConsumerStatefulWidget<DestinationScreenTopIcons> {
  @override
  Widget build(BuildContext context) {
    final isFavorite =
        ref.watch(favoritesProvider).data.contains(widget.destinationId);

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
              ref
                  .read(favoritesProvider.notifier)
                  .toggleFavorite(widget.destinationId);
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
          color: uiColors.onImage,
        ),
        child: Center(child: icon),
      ),
    );
  }
}
