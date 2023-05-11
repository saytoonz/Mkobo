import 'package:flutter_svg/svg.dart';

import '../model/transaction_model.dart';
import '../utils/app_colors.dart';
import '../utils/utilities.dart';

import 'package:flutter/material.dart';

class RecentTransactions extends StatelessWidget {
  const RecentTransactions({
    super.key,
    required ScrollController scrollController,
  }) : _scrollController = scrollController;

  final ScrollController _scrollController;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: _scrollController,
      shrinkWrap: true,
      itemCount: transactions.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 25,
            vertical: 12,
          ),
          child: Row(
            children: [
              Container(
                height: 35,
                width: 35,
                decoration: BoxDecoration(
                  color: index == 0
                      ? const Color(0xFFD6D8D3).withOpacity(0.3)
                      : transactions[index].type == TransactionTyp.debit
                          ? AppColors.lightRed
                          : AppColors.lightGreen,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: index == 0
                    ? Image.asset('assets/png/netflix.png')
                    : Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SvgPicture.asset(
                          'assets/svg/${transactions[index].type == TransactionTyp.debit ? 'arrow-up' : 'arrow-down'}.svg',
                        ),
                      ),
              ),
              const SizedBox(
                width: 14,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      transactions[index].type == TransactionTyp.debit
                          ? 'Paid for'
                          : 'Received Money From FBN',
                      style: TextStyle(
                        color: AppColors.textColor.withOpacity(0.5),
                        fontSize: 12,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    Text(
                      transactions[index].title,
                      style: const TextStyle(
                        color: AppColors.textColor,
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    transactions[index].date,
                    style: TextStyle(
                      color: AppColors.textColor.withOpacity(0.5),
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        '₦',
                        style: TextStyle(
                          color: AppColors.textColor,
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        Utils.numberToAmount(transactions[index].amount),
                        style: const TextStyle(
                          color: AppColors.textColor,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
