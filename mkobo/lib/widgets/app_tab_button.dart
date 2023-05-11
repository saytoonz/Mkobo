import '../utils/app_colors.dart';
import 'package:flutter/material.dart';

class AppTabButton extends StatelessWidget {
  const AppTabButton({
    super.key,
    required this.title,
    required this.onTap,
    this.notifications = 0,
    required this.isSelected,
  });

  final String title;
  final int notifications;
  final Function() onTap;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        height: 35,
        width: MediaQuery.of(context).size.height,
        child: Center(
          child: Text(
            title,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: isSelected
                  ? AppColors.primaryBlue
                  : AppColors.textColor.withOpacity(0.5),
            ),
          ),
        ),
      ),
    );
  }
}
