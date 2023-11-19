import 'package:chuck_norris/src/widgets/common/bottom_nawbar/custom_bottom_navbar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NestedNavigation extends StatelessWidget {
  const NestedNavigation({
    Key? key,
    required this.navigationShell,
  }) : super(key: key ?? const ValueKey('ScaffoldWithNestedNavigation'));
  final StatefulNavigationShell navigationShell;

  void _goBranch(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: navigationShell,
      bottomNavigationBar: CustomBottomNawBar(callback: _goBranch),
    );
  }
}
