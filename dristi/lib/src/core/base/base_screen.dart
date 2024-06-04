import 'package:dristi/src/core/base/base_consumer_stateful_widget.dart';
import 'package:dristi/src/core/constants/app_values.dart';
import 'package:dristi/src/core/global_widgets/network_error_alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BaseScreen extends ConsumerStatefulWidget {
  const BaseScreen({
    Key? key,
    this.callback,
    this.appBar,
    this.body,
  }) : super(key: key);

  final Future<void> Function()? callback;
  final Widget? appBar;
  final Widget? body;

  @override
  ConsumerState createState() => _BaseScreenState();
}

class _BaseScreenState extends BaseConsumerStatefulWidget<BaseScreen> {
  @override
  void initState() {
    super.initState();
    if (widget.callback != null) {
      Future.microtask(() => widget.callback!());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: widget.callback != null
            ? () async {
                widget.callback!();
              }
            : () async {},
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              floating: true,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                background: widget.appBar,
              ),
              expandedHeight: AppValues.dimen_70.h,
            ),
            const SliverToBoxAdapter(
              child: NetworkErrorAlert(),
            ),
            SliverToBoxAdapter(
              child: widget.body,
            ),
          ],
        ),
      ),
    );
  }
}
