import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../generated/l10n.dart';

class BaseScreen extends StatelessWidget {
  const BaseScreen({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          S.of(context).fontCheck,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: _buildBottomNavBarItems,
        currentIndex: navigationShell.currentIndex,
        // showSelectedLabels: false,
        // showUnselectedLabels: false,
        onTap: (index) => navigationShell.goBranch(
          index,
          initialLocation: index == navigationShell.currentIndex,
        ),
      ),
    );
  }

  List<BottomNavigationBarItem> get _buildBottomNavBarItems => [
        const BottomNavigationBarItem(
          icon: Icon(Icons.note),
          label: 'Home',
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.favorite),
          label: '',
        ),
      ];
}
