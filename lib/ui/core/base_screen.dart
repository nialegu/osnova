import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../generated/l10n.dart';

class BaseScreen extends StatelessWidget {
  const BaseScreen({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        enableFeedback: true,
        items: _buildBottomNavBarItems(context),
        currentIndex: navigationShell.currentIndex,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: (index) => navigationShell.goBranch(
          index,
          initialLocation: index == navigationShell.currentIndex,
        ),
      ),
      body: navigationShell,
    );
  }

  List<BottomNavigationBarItem> _buildBottomNavBarItems(BuildContext context) =>
      [
        BottomNavigationBarItem(
          icon: const Icon(Icons.home),
          label: S.of(context).home,
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.favorite),
          label: S.of(context).parties,
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.chat),
          label: S.of(context).chats,
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.person),
          label: S.of(context).me,
        ),
      ];
}
