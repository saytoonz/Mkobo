import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../widgets/custom_bottom_nav_item.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onItemTap,
  });
  final int currentIndex;
  final Function(int) onItemTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomBottomNavItem(
              title: 'Accounts',
              isSelected: currentIndex == 0,
              onTap: () {
                onItemTap(0);
              },
            ),
            const SizedBox(
              width: 20,
            ),
            CustomBottomNavItem(
              title: 'Mkolo',
              isSelected: currentIndex == 1,
              onTap: () {
                onItemTap(1);
              },
            ),
            const Spacer(),
            CustomBottomNavItem(
              title: 'EarlyPay',
              isSelected: currentIndex == 2,
              onTap: () {
                onItemTap(2);
              },
            ),
            const SizedBox(
              width: 20,
            ),
            CustomBottomNavItem(
              title: 'Menu',
              isSelected: currentIndex == 3,
              isTooBig: true,
              onTap: () {
                onItemTap(3);
              },
            ),
          ],
        ),
      ),
    );
  }
}
