import 'package:provider/provider.dart';

import '../components/custom_tab_bar.dart';
import '../components/recent_transactions.dart';
import '../model/quick_access_item_model.dart';
import '../providers/animation_provider.dart';
import '../utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import '../widgets/account_card.dart';
import '../widgets/account_user.dart';
import '../widgets/action_button.dart';
import '../widgets/quick_access.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _MyDashboardScreenState();
}

class _MyDashboardScreenState extends State<DashboardScreen>
    with TickerProviderStateMixin {
  int selectedCard = 0;

  late AnimationController _animationController;
  final ScrollController _cardScrollController = ScrollController();
  final int _numOfCards = 2;
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
    );

    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      _cardScrollController.addListener(() {
        double maxScroll = _cardScrollController.position.maxScrollExtent;
        double currentScroll = _cardScrollController.position.pixels;
        double delta = 20.0;
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
    return ChangeNotifierProvider(
      create: (BuildContext context) {
        return AnimationProvider(_animationController);
      },
      child: Scaffold(
        body: SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            children: [
              // AppBar
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

              //Count cards
              Row(
                children: [
                  SizedBox(
                    width: 27,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(5),
                      onTap: selectedCard == 0
                          ? null
                          : () {
                              _cardScrollController.animateTo(
                                _cardScrollController.position.minScrollExtent,
                                duration: const Duration(milliseconds: 200),
                                curve: Curves.fastOutSlowIn,
                              );
                            },
                      child: Icon(
                        Icons.arrow_back_ios_new,
                        size: selectedCard != 0 ? 28 : 18,
                        color: selectedCard != 0
                            ? AppColors.primaryBlue
                            : AppColors.gray,
                      ),
                    ),
                  ),
                  Expanded(
                      child: IgnorePointer(
                    ignoring: false,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      controller: _cardScrollController,
                      physics: const NeverScrollableScrollPhysics(),
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
                  SizedBox(
                    width: 27,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(5),
                      onTap: selectedCard != 0
                          ? null
                          : () {
                              _cardScrollController.animateTo(
                                _cardScrollController.position.maxScrollExtent,
                                duration: const Duration(milliseconds: 200),
                                curve: Curves.fastOutSlowIn,
                              );
                            },
                      child: Icon(
                        Icons.arrow_forward_ios,
                        size: selectedCard == 0 ? 28 : 18,
                        color: selectedCard == 0
                            ? AppColors.primaryBlue
                            : AppColors.gray,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),

              /// Tabs
              // Custom Tab with indicator animation
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 25),
                padding: const EdgeInsets.symmetric(
                  horizontal: 4,
                  vertical: 3,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFFE6E9ED).withOpacity(0.95), //E6E9ED
                  borderRadius: BorderRadius.circular(9),
                ),
                child: CustomTabBar(
                  onTap: () {
                    setState(() {});
                  },
                ),
              ),
              const SizedBox(
                height: 26,
              ),

              /// QuickAccess
              QuickAccess(
                items: [
                  QuickAccessItemModel(
                    svg: 'phone-digital-communication-tool',
                    title: 'Buy Airtime',
                  ),
                  QuickAccessItemModel(
                    svg: 'pay-bills',
                    title: 'Pay Bills',
                  ),
                  QuickAccessItemModel(
                    svg: 'fund-account-2',
                    title: 'Fund Account',
                  ),
                ],
              ),

              //Recent Transactions
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Recent Transactions',
                      style: TextStyle(
                        color: AppColors.titleTextColor,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: AppColors.lightBlue.withOpacity(.6),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(4),
                          onTap: () {},
                          child: const Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 21,
                              vertical: 4,
                            ),
                            child: Text(
                              'More',
                              style: TextStyle(
                                color: AppColors.primaryBlue,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 26,
              ),
              //Recent Transactions List
              RecentTransactions(
                scrollController: _scrollController,
              ),
            ],
          ),
        ),
      ),
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
