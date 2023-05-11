import 'package:flutter/material.dart';
import 'package:mkobo/pages/home_page_one.dart';
import 'package:mkobo/pages/home_page_two.dart';
import 'package:mkobo/utils/app_colors.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(),
          ElevatedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return const HomePageTwo();
                },
              ));
            },
            child: const Text(
              'Open Empty State',
              style: TextStyle(
                color: AppColors.primaryBlue,
                fontSize: 20,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return const HomePageOne();
                },
              ));
            },
            child: const Text(
              'Open Dashboard',
              style: TextStyle(
                color: AppColors.primaryBlue,
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
