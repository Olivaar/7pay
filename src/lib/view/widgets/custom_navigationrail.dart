import 'package:flutter/material.dart';
import '../../utils/colors.dart';

class CustomNavigationRail extends StatefulWidget {
  const CustomNavigationRail({super.key});

  @override
  _CustomNavigationRailState createState() => _CustomNavigationRailState();
}

class _CustomNavigationRailState extends State<CustomNavigationRail> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return NavigationRail(
          backgroundColor: cinzaEscuro,
          labelType: constraints.maxWidth > 600
              ? NavigationRailLabelType.all
              : NavigationRailLabelType.selected,
          unselectedLabelTextStyle: const TextStyle(color: laranja),
          selectedIndex: _selectedIndex,
          onDestinationSelected: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          destinations: <NavigationRailDestination>[
            _NavigationRailDestination(Icons.home_outlined, "Home"),
            _NavigationRailDestination(Icons.credit_card, "Pagamentos"),
            _NavigationRailDestination(Icons.attach_money, "Faturas"),
            _NavigationRailDestination(Icons.file_upload_outlined, "Uploads"),
            _NavigationRailDestination(Icons.newspaper, "Notícias"),
            _NavigationRailDestination(Icons.bar_chart, "Relatórios"),
            _NavigationRailDestination(Icons.donut_large_outlined, "Estatísticas"),
            _NavigationRailDestination(Icons.grid_view_outlined, "Mais"),
          ],
        );
      },
    );
  }
}

class _NavigationRailDestination extends NavigationRailDestination {
  _NavigationRailDestination(IconData icon, String label)
      : super(
    icon: Icon(icon, color: laranja),
    selectedIcon: Icon(icon, color: Colors.white,),
    label: Text(label, style: const TextStyle(color: Colors.white),),
  );
}
