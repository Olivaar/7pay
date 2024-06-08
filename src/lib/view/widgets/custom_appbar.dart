import 'package:avaliacao_seven_pay/utils/colors.dart';
import 'package:flutter/material.dart';

import '../../utils/app_strings.dart';
import '../../utils/theme_helper.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight * 1.5);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AppBar(
      backgroundColor: Colors.white,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppStrings.greetingMessage('joao'),
            style: ThemeHelper().textStyleBold35()
          ),
          Text(
            AppStrings.welcomeMessage,
            style: theme.textTheme.bodyMedium,
          ),
        ],
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.message_outlined, color: cinzaEscuro,),
          tooltip: AppStrings.messagesTooltip,
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.notification_add_outlined, color: cinzaEscuro,),
          tooltip: AppStrings.notificationsTooltip,
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.person_outline, color: cinzaEscuro,),
          tooltip: AppStrings.profileTooltip,
        ),
      ],
    );
  }
}
