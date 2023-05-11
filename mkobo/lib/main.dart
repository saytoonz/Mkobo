// ignore_for_file: unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mkobo/utils/app_colors.dart';

import 'widgets/action_button.dart';

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
      ),
      home: const Homepage(),
    );
  }
}

class Homepage extends StatefulWidget {
  const Homepage({super.key});
  @override
  State<Homepage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Homepage> {
  final ScrollController _cardScrollController = ScrollController();

  final int _numOfCards = 2;
  int selectedCard = 0;

  @override
  void initState() {
    super.initState();

    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      _cardScrollController.addListener(() {
        double maxScroll = _cardScrollController.position.maxScrollExtent;
        double currentScroll = _cardScrollController.position.pixels;
        double delta = 5.0; // or something else..
        if (maxScroll - currentScroll <= delta) {
          selectedCard = 1;
          setState(() {});
        } else {
          selectedCard = 0;
          setState(() {});
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 25.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Expanded(
                    child: AccountUser(),
                  ),
                  Actions()
                ],
              ),
            ),
            Row(
              children: [
                IconButton(
                  onPressed: selectedCard == 0
                      ? null
                      : () {
                          _cardScrollController.animateTo(
                            _cardScrollController.position.minScrollExtent,
                            duration: const Duration(milliseconds: 200),
                            curve: Curves.fastOutSlowIn,
                          );
                        },
                  icon: Icon(
                    Icons.arrow_back_ios_new,
                    size: selectedCard != 0 ? 28 : 18,
                    color: selectedCard != 0
                        ? AppColors.primaryBlue
                        : AppColors.gray,
                  ),
                ),
                Expanded(
                    child: IgnorePointer(
                  ignoring: true,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    controller: _cardScrollController,
                    child: Row(
                      children: [
                        ...List.generate(
                          _numOfCards,
                          (index) => AccountCard(
                            addSpace: index != (_numOfCards - 1),
                          ),
                        ),
                      ],
                    ),
                  ),
                )),
                IconButton(
                  onPressed: selectedCard != 0
                      ? null
                      : () {
                          _cardScrollController.animateTo(
                            _cardScrollController.position.maxScrollExtent,
                            duration: const Duration(milliseconds: 200),
                            curve: Curves.fastOutSlowIn,
                          );
                        },
                  icon: Icon(
                    Icons.arrow_forward_ios,
                    size: selectedCard == 0 ? 28 : 18,
                    color: selectedCard == 0
                        ? AppColors.primaryBlue
                        : AppColors.gray,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class AccountCard extends StatelessWidget {
  const AccountCard({
    super.key,
    required this.addSpace,
  });

  final bool addSpace;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: addSpace ? 10 : 0),
      height: 140,
      width: MediaQuery.of(context).size.width - 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        gradient: const LinearGradient(
          colors: [
            AppColors.secondaryBlue,
            AppColors.primaryBlue,
          ],
          stops: [0.0182, 1],
        ),
      ),
      child: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Text('Avalaible Balance'),
                      RichText(
                        text: TextSpan(
                          text: '₦',
                          children: [
                            TextSpan(
                              text: '690,390.68',
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Text('Tier 1'),
                )
              ],
            ),
          ),
          Divider(),
          Row(
            children: [
              SvgPicture.asset('assets/svg/fund-account.svg'),
              Text('Fund Account')
            ],
          ),
        ],
      ),
    );
  }
}

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

class Actions extends StatelessWidget {
  const Actions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ActionButton(
          svgName: 'contact-support',
          onTap: () {},
        ),
        const SizedBox(
          width: 2,
        ),
        ActionButton(
          svgName: 'notification',
          onTap: () {},
        ),
      ],
    );
  }
}
