import 'package:dristi/src/core/base/base_consumer_stateful_widget.dart';
import 'package:dristi/src/core/constants/app_values.dart';
import 'package:dristi/src/core/global_widgets/empty_list_image.dart';
import 'package:dristi/src/core/routes/app_routes.dart';
import 'package:dristi/src/core/utils/localization_ext.dart';
import 'package:dristi/src/features/destination/presentation/riverpod/destination_data/destination_provider.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class DestinationScreenBlogsBuilder extends ConsumerStatefulWidget {
  const DestinationScreenBlogsBuilder({
    super.key,
  });

  @override
  ConsumerState createState() => _DestinationScreenBlogsBuilderState();
}

class _DestinationScreenBlogsBuilderState
    extends BaseConsumerStatefulWidget<DestinationScreenBlogsBuilder> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        _buildCommonBlogMessage(),
        _buildBlogsList(),
      ],
    );
  }

  Widget _buildBlogsList() {
    final destinationDataState = ref.watch(destinationProvider);
    final blogs = destinationDataState.data.blogs;

    if (blogs.isEmpty) {
      return const EmptyListImage();
    }

    return ListView.builder(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: blogs.length,
      itemBuilder: (context, index) {
        final blog = blogs[index];
        return GestureDetector(
          onTap: () {
            navigateToWebView(url: blog.url);
          },
          child: Card(
            color: uiColors.scrim,
            elevation: 1,
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: AppValues.dimen_10.h,
                horizontal: AppValues.dimen_16.r,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    blog.title,
                    style: appTextStyles.secondaryNovaRegular16,
                  ),
                  SizedBox(height: AppValues.dimen_10.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        blog.author,
                        style: appTextStyles.primaryNovaRegular12,
                      ),
                      SizedBox(width: AppValues.dimen_10.w),
                      Text(
                        blog.site,
                        style: appTextStyles.secondaryNovaRegular12,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildCommonBlogMessage() {
    return Container(
      padding: EdgeInsets.all(AppValues.dimen_10.r),
      margin: EdgeInsets.all(AppValues.dimen_10.r),
      decoration: BoxDecoration(
        border: Border.all(color: uiColors.primary),
        borderRadius: BorderRadius.circular(AppValues.dimen_10.r),
      ),
      child: RichText(
        text: TextSpan(
          text: '${context.localization.commonBlogMessage} ',
          style: appTextStyles.secondaryNovaRegular12,
          children: [
            TextSpan(
              text: context.localization.contactUs,
              style: appTextStyles.primaryNovaRegular12,
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  navigateToPromotionScreen();
                },
            ),
          ],
        ),
      ),
    );
  }

  void navigateToWebView({required String url}) {
    context.pushNamed(AppRoutes.webView, extra: url);
  }

  void navigateToPromotionScreen() {
    context.pushNamed(AppRoutes.promotion);
  }
}
