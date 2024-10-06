import 'package:dristi/src/core/base/base_consumer_stateful_widget.dart';
import 'package:dristi/src/core/constants/app_values.dart';
import 'package:dristi/src/core/global_widgets/asset_image_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SocialAccountsTile extends ConsumerStatefulWidget {
  const SocialAccountsTile({
    required this.title,
    required this.url,
    required this.icon,
    super.key,
  });

  final String title;
  final String url;
  final String icon;

  @override
  ConsumerState createState() => _SocialAccountsTileState();
}

class _SocialAccountsTileState
    extends BaseConsumerStatefulWidget<SocialAccountsTile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        widget.title,
        style: appTextStyles.secondaryNovaRegular16,
      ),
      trailing: AssetImageView(
        fileName: widget.icon,
        height: AppValues.dimen_28.r,
        width: AppValues.dimen_28.r,
      ),
      onTap: () {},
    );
  }
}
