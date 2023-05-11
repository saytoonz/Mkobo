import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../utils/app_colors.dart';
import 'action_button.dart';

class AccountCard extends StatelessWidget {
  const AccountCard({
    super.key,
    required this.addSpace,
    this.isEmptyState = false,
  });

  final bool addSpace;
  final bool isEmptyState;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: addSpace ? 6 : 0),
      height: 140,
      width: MediaQuery.of(context).size.width - 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        gradient: const LinearGradient(
          colors: [
            Color.fromARGB(255, 33, 90, 196),
            AppColors.primaryBlue,
          ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          stops: [0.1, 0.4],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Stack(
              alignment: Alignment.bottomRight,
              children: [
                Image.asset(
                  'assets/png/mask.png',
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 10,
                    left: 14,
                    right: 14,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Available Balance',
                              style: TextStyle(
                                color: AppColors.white.withOpacity(
                                  0.5,
                                ),
                                fontSize: 11.72,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            const SizedBox(
                              height: 13,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  '₦',
                                  style: TextStyle(
                                    color: AppColors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Text(
                                  isEmptyState ? '0.00' : '690,390.68',
                                  style: const TextStyle(
                                    color: AppColors.white,
                                    fontSize: 22,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Visibility(
                                  visible: !isEmptyState,
                                  child: Material(
                                    color: Colors.transparent,
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 2.0),
                                      child: ActionButton(
                                        svgName: 'eye',
                                        onTap: () {},
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 9,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: const Text(
                          'Tier 1',
                          style: TextStyle(
                            color: AppColors.primaryBlue,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 14,
            ),
            child: Divider(
              color: AppColors.white.withOpacity(0.3),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          isEmptyState
              ? Padding(
                  padding: const EdgeInsets.only(
                    left: 14,
                    right: 14,
                    bottom: 11,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/svg/person.svg',
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        'Verify  Your Identity',
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      SvgPicture.asset(
                        'assets/svg/arrow-forward.svg',
                      ),
                    ],
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.only(
                    left: 14,
                    right: 14,
                    bottom: 11,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/svg/fund-account.svg',
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        'Fund Account',
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: 11.72,
                          fontWeight: FontWeight.w400,
                        ),
                      )
                    ],
                  ),
                ),
        ],
      ),
    );
  }
}
