import 'package:flutter/material.dart';
import '../../utils/colors.dart';
import '../../utils/theme_helper.dart';
import '../widgets/custom_appbar.dart';
import '../widgets/custom_navigationrail.dart';
import '../widgets/list_address_container.dart';
import '../widgets/search_container.dart';

class AddressSearchPage extends StatefulWidget {
  const AddressSearchPage({super.key});

  @override
  State<AddressSearchPage> createState() => _AddressSearchPageState();
}

class _AddressSearchPageState extends State<AddressSearchPage> {
  static const double kHorizontalPadding = 40.0;
  static const double kVerticalPadding = 20.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isWideScreen = constraints.maxWidth > 600;

          return Row(
            children: [
              if (isWideScreen)
                _buildNavigationRail(),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: isWideScreen ? 65 : kToolbarHeight,
                      child: CustomAppBar(),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: kHorizontalPadding, vertical: kVerticalPadding),
                      child: Text(
                        'Endereços',
                        style: ThemeHelper().textStyleBold35(),
                      ),
                    ),
                    SearchContainer(),
                    const SizedBox(height: kVerticalPadding),
                    const Padding(
                      padding: EdgeInsets.only(bottom: 20),
                      child: ListAddressContainer(),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildNavigationRail() {
    return Container(
      color: cinzaEscuro,
      width: 120,
      child: Column(
        children: [
          const SizedBox(height: 10),
          Image.asset(
            'assets/images/7pay_logo.png',
            filterQuality: FilterQuality.high,
            fit: BoxFit.cover,
            width: 100,
            height: 50,
          ),
          const Divider(),
          const Expanded(child: CustomNavigationRail()),
          _buildHelpAndSettingsButtons(),
        ],
      ),
    );
  }

  Widget _buildHelpAndSettingsButtons() {
    return Column(
      children: [
        TextButton.icon(
          onPressed: () {},
          label: Text('Get Help', style: ThemeHelper().textStyleOrange()),
          icon: const Icon(Icons.help_outline, color: laranja),
        ),
        TextButton.icon(
          onPressed: () {},
          label: Text('Configurações', style: ThemeHelper().textStyleOrange()),
          icon: const Icon(Icons.settings, color: laranja),
        ),
      ],
    );
  }
}
