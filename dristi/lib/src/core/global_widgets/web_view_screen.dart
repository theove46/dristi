import 'package:dristi/src/core/base/base_stateful_widget.dart';
import 'package:dristi/src/core/constants/app_values.dart';
import 'package:dristi/src/core/global_widgets/shimmers.dart';
import 'package:dristi/src/features/home/advertisements/domain/entity/advertisement_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatefulWidget {
  const WebViewScreen({
    required this.item,
    super.key,
  });

  final AdvertisementEntity item;

  @override
  State<WebViewScreen> createState() => _WebViewScreenState();
}

class _WebViewScreenState extends BaseStatefulWidget<WebViewScreen> {
  late WebViewController controller;
  bool loading = true;

  @override
  void initState() {
    super.initState();

    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {},
          onPageStarted: (String url) {},
          onPageFinished: (String url) {
            setState(() {
              loading = false;
            });
          },
          onWebResourceError: (WebResourceError error) {},
        ),
      )
      ..loadRequest(Uri.parse(widget.item.url));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: const NeverScrollableScrollPhysics(),
        // Sliver AppBar is not working with webView Package,
        // so here added NeverScrollableScrollPhysics()
        slivers: [
          _buildSliverAppBar(),
          SliverFillRemaining(
            child: _buildWebView(),
          ),
        ],
      ),
    );
  }

  Widget _buildSliverAppBar() {
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
    return AppBar(
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back_ios,
        ),
        onPressed: () async {
          if (await controller.canGoBack()) {
            controller.goBack();
          } else if (mounted) {
            context.pop();
          }
        },
      ),
      title: Text(
        widget.item.title,
        style: appTextStyles.primaryNovaSemiBold16,
      ),
      centerTitle: true,
    );
  }

  Widget _buildWebView() {
    return Stack(
      alignment: Alignment.center,
      children: [
        loading
            ? buildWebViewShimmer(context)
            : WebViewWidget(
                controller: controller,
              ),
      ],
    );
  }
}
