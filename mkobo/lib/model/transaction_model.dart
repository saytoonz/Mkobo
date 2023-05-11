// ignore_for_file: public_member_api_docs, sort_constructors_first
class TransactionModel {
  TransactionTyp type;
  String title;
  String date;
  num amount;

  TransactionModel(
      {required this.type,
      required this.title,
      required this.date,
      required this.amount});
}

enum TransactionTyp { debit, credit }

List<TransactionModel> transactions = [
  TransactionModel(
    date: 'Apr 28',
    title: 'Netflix',
    type: TransactionTyp.debit,
    amount: -3000.00,
  ),
  TransactionModel(
    date: 'Apr 28',
    title: 'Spectranet',
    type: TransactionTyp.debit,
    amount: -3000.00,
  ),
  TransactionModel(
    date: 'Apr 28',
    title: 'Demilade',
    type: TransactionTyp.credit,
    amount: 3000.00,
  ),
  TransactionModel(
    date: 'Apr 28',
    title: 'Demilade',
    type: TransactionTyp.credit,
    amount: 3000.00,
  ),
  TransactionModel(
    date: 'Apr 28',
    title: 'Demilade',
    type: TransactionTyp.credit,
    amount: 3000.00,
  ),
];
