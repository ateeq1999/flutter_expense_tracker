import 'package:flutter/material.dart';

import './new_transaction.dart';
import './transaction_list.dart';

import '../models/transaction.dart';

class UserTransactions extends StatefulWidget {
  @override
  _UserTransactionsState createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  final List<Transaction> _userTransation = [
    Transaction(
      id: 't1',
      title: 'new Shose',
      amount: 19.00,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'coffee',
      amount: 10.00,
      date: DateTime.now(),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTransaction(),
        TransactionList(
          _userTransation,
        ),
      ],
    );
  }
}
