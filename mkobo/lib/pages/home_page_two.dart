import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'empty_state_page.dart';

import '../components/bottom_nav_bar.dart';
import '../utils/app_colors.dart';

class HomePageTwo extends StatefulWidget {
  const HomePageTwo({super.key});

  @override
  State<HomePageTwo> createState() => _HomePageTwoState();
}

class _HomePageTwoState extends State<HomePageTwo> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Column(
              children: [
                Expanded(
                  child: IndexedStack(
                    index: currentIndex,
                    children: const [
                      // Container(
                      //   color: AppColors.black,
                      // ),
                      EmptyStateScree(),
                      EmptyStateScree(),
                      EmptyStateScree(),
                      EmptyStateScree(),
                    ],
                  ),
                ),
                BottomNavBar(
                  currentIndex: currentIndex,
                  onItemTap: (index) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                ),
              ],
            ),
            Positioned(
              bottom: 20,
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(5),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: SvgPicture.asset(
                      'assets/svg/send-money.svg',
                      height: 50,
                      width: 50,
                    ),
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  const Text(
                    'Transfer Money',
                    style: TextStyle(
                      color: AppColors.primaryBlue,
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
