// ignore_for_file: unrelated_type_equality_checks

import 'package:flutter/material.dart';

import 'pages/landing_page.dart';
import 'utils/app_colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Axiforma',
        useMaterial3: true,
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: AppColors.white,
      ),
      home: const LandingPage(),
    );
  }
}
