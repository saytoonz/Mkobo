import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../utils/app_colors.dart';

class AccountUser extends StatelessWidget {
  const AccountUser({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Welcome, Lanre!',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: AppColors.black,
          ),
        ),
        Row(
          children: [
            RichText(
              text: TextSpan(
                text: 'Account no : ',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: AppColors.gray,
                ),
                children: const [
                  TextSpan(
                    text: '533423243542',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: AppColors.black,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 14,
            ),
            SvgPicture.asset(
              'assets/svg/fluent-24-regular.svg',
            ),
          ],
        ),
      ],
    );
  }
}
