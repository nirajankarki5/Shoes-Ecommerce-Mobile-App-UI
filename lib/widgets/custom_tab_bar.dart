import 'package:flutter/material.dart';
import 'package:shoes_ecommerce/utils/colors.dart';

class CustomTabBar extends StatelessWidget {
  final List<IconData> icons;
  final int selectedIndex;
  final Function(int) onTap;

  CustomTabBar({
    required this.icons,
    required this.selectedIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15.0),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0))),
      height: 70.0,
      child: TabBar(
        indicator: BoxDecoration(
          color: buttonColor,
          shape: BoxShape.circle,
        ),
        tabs: icons
            .asMap()
            .map(
              (i, e) => MapEntry(
                  i,
                  Tab(
                    icon: Icon(
                      e,
                      color:
                          i == selectedIndex ? Colors.white : Colors.grey[500],
                      size: 25.0,
                    ),
                  )),
            )
            .values
            .toList(),
        onTap: onTap,
      ),
    );
  }
}
