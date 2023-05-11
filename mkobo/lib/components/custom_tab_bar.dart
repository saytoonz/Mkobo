import '../providers/animation_provider.dart';
import 'package:provider/provider.dart';

import '../utils/app_colors.dart';
import 'package:flutter/material.dart';

import '../widgets/app_tab_button.dart';

class CustomTabBar extends StatelessWidget {
  const CustomTabBar({
    super.key,
    required this.onTap,
  });

  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Consumer<AnimationProvider>(
      builder: (context, notifier, child) {
        double halveWidth = (MediaQuery.of(context).size.width / 2) - 26;
        return Stack(
          children: [
            Container(
              width: halveWidth,
              height: 35,
              margin: EdgeInsets.only(
                left: halveWidth * notifier.value,
              ),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(6),
                border: Border.all(color: const Color(0xFFE0E0E0)),
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: AppTabButton(
                    title: 'Spending  Account',
                    onTap: () {
                      notifier.reverse().then((value) => onTap());
                    },
                    isSelected: notifier.value < 0.5,
                  ),
                ),
                Expanded(
                  child: AppTabButton(
                    title: 'Linked accounts',
                    onTap: () async {
                      notifier.forward().then((value) => onTap());
                    },
                    isSelected: notifier.value > 0.5,
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
