import 'package:dristi/src/core/base/base_consumer_stateful_widget.dart';
import 'package:dristi/src/core/constants/app_assets.dart';
import 'package:dristi/src/core/global_providers/deep_linking_providers/deep_linking_provider.dart';
import 'package:dristi/src/core/global_widgets/primary_snackbar.dart';
import 'package:dristi/src/core/utils/localization_ext.dart';
import 'package:dristi/src/features/settings/presentation/riverpod/settings_provider.dart';
import 'package:dristi/src/features/settings/presentation/widgets/settings_bottom_sheet.dart';
import 'package:dristi/src/features/settings/presentation/widgets/settings_item.dart';
import 'package:dristi/src/features/settings/presentation/widgets/social_accounts_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class Contact extends ConsumerStatefulWidget {
  const Contact({super.key});

  @override
  ConsumerState createState() => _ContactState();
}

class _ContactState extends BaseConsumerStatefulWidget<Contact> {
  @override
  Widget build(BuildContext context) {
    final settingsState = ref.watch(settingsProvider);

    final deepLinkingNotifier = ref.read(deepLinkingProvider.notifier);

    if (settingsState.data == null || settingsState.data.contact == null) {
      return const SizedBox.shrink();
    }

    final contactState = settingsState.data!.contact!;

    final whatsAppErrorMessage = context.localization.whatsAppLoadingError;

    Widget buildCallBackWidget() {
      return Column(
        children: [
          SocialAccountsTile(
            title: context.localization.email,
            url: contactState.email,
            icon: Assets.email,
            onPressed: () {},
          ),
          SocialAccountsTile(
            title: context.localization.whatsapp,
            url: contactState.whatsapp,
            icon: Assets.whatsapp,
            onPressed: () async {
              context.pop();
              try {
                await deepLinkingNotifier.navigateToWhatsappMessage(
                  phoneNumber: settingsState.data.contact.whatsapp,
                );
              } catch (error) {
                errorSnackBar(whatsAppErrorMessage);
              }
            },
          ),
        ],
      );
    }

    return SettingsItems(
      icon: Assets.contact,
      title: context.localization.contactUs,
      onTap: () {
        showModalBottomSheet(
          context: context,
          builder: (context) {
            return SettingsBottomSheet(
              title: context.localization.contactUs,
              description: contactState.description,
              callBackWidget: buildCallBackWidget(),
            );
          },
        );
      },
    );
  }

  void errorSnackBar(String message) async {
    ShowSnackBarMessage.showErrorSnackBar(
      message: message,
      context: context,
    );
  }
}
