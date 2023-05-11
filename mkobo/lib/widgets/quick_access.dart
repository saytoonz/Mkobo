import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../model/quick_access_item_model.dart';
import '../utils/app_colors.dart';

class QuickAccess extends StatelessWidget {
  const QuickAccess({
    super.key,
    required this.items,
  });

  final List<QuickAccessItemModel> items;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: items.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 0.0,
        childAspectRatio: 1.1,
      ),
      itemBuilder: (context, index) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              height: 56,
              width: 56,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.primaryBlue,
              ),
              child: SvgPicture.asset(
                'assets/svg/${items[index].svg}.svg',
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              items[index].title,
              style: const TextStyle(
                color: AppColors.primaryBlue,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        );
      },
    );
  }
}
