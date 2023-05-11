import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../utils/app_colors.dart';

class CustomBottomNavItem extends StatelessWidget {
  const CustomBottomNavItem({
    super.key,
    required this.title,
    required this.isSelected,
    required this.onTap,
    this.isTooBig = false,
  });

  final bool isSelected;
  final String title;
  final Function()? onTap;
  final bool isTooBig;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        padding: const EdgeInsets.only(top: 10),
        width: 52,
        child: Column(
          children: [
            SvgPicture.asset(
              'assets/svg/${title.toLowerCase()}.svg',
              height: isTooBig ? 18 : 24,
              width: isTooBig ? 18 : 24,
              colorFilter: ColorFilter.mode(
                isSelected
                    ? AppColors.primaryBlue
                    : AppColors.titleTextColor.withOpacity(0.5),
                BlendMode.srcIn,
              ),
            ),
            SizedBox(
              height: 8 + (isTooBig ? 4 : 0),
            ),
            Text(
              title,
              style: TextStyle(
                color: isSelected
                    ? AppColors.primaryBlue
                    : AppColors.titleTextColor.withOpacity(0.5),
                fontSize: 10,
                fontWeight: FontWeight.w600,
              ),
            )
          ],
        ),
      ),
    );
  }
}
