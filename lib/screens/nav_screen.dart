import 'package:flutter/material.dart';
import 'package:shoes_ecommerce/screens/home_screen.dart';
import 'package:shoes_ecommerce/screens/my_bag_screen.dart';
import 'package:shoes_ecommerce/widgets/custom_tab_bar.dart';

class NavScreen extends StatefulWidget {
  @override
  _NavScreenState createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  final List<Widget> _screens = [
    const HomeScreen(),
    const Scaffold(),
    const Scaffold(),
    const MyBagScreen(),
    const Scaffold(),
  ];
  final List<IconData> _icons = [
    Icons.home_outlined,
    Icons.chat_bubble_outline,
    Icons.favorite_border,
    Icons.local_mall_outlined,
    Icons.person_outline,
  ];

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _icons.length,
      child: Scaffold(
        extendBody: true,
        body: IndexedStack(
          index: _selectedIndex,
          children: _screens,
        ),
        bottomNavigationBar: CustomTabBar(
          icons: _icons,
          selectedIndex: _selectedIndex,
          onTap: (index) => setState(() => _selectedIndex = index),
        ),
      ),
    );
  }
}
