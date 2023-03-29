import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class MybottomNavbar extends StatelessWidget {
  final void Function(int)? ontapped;
  const MybottomNavbar({super.key, required this.ontapped});

  @override
  Widget build(BuildContext context) {
    return GNav(
        gap: 8,
        padding: const EdgeInsets.all(20),
        tabBorderRadius: 16,
        color: Colors.grey[400],
        activeColor: Colors.grey.shade700,
        tabBackgroundColor: Colors.grey.shade100,
        tabActiveBorder: Border.all(color: Colors.white),
        mainAxisAlignment: MainAxisAlignment.center,
        onTabChange: (value) => ontapped!(value),
        tabs: [
          GButton(
            icon: Icons.home,
            text: 'Home',
          ),
          GButton(
            icon: Icons.shopping_bag_rounded,
            text: 'Cart',
          ),
        ]);
  }
}
