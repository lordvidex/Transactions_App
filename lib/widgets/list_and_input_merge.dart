import './transaction_list.dart';
import './transcation_textfields.dart';
import 'package:flutter/material.dart';
import '../models/transaction.dart';

class ListAndInputMerge extends StatefulWidget {
  @override
  _ListAndInputMergeState createState() => _ListAndInputMergeState();
}

class _ListAndInputMergeState extends State<ListAndInputMerge> {
  final List<Transaction> _transactionLists = [
    Transaction(
      id: 't1',
      title: 'New Shoes',
      amount: 69.99,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'Weekly Groceries',
      amount: 16.53,
      date: DateTime.now(),
    ),
  ];
  void _addNewTransactions(String txTitle, double txAmount) {
    final newTx = Transaction(
        title: txTitle,
        amount: txAmount,
        date: DateTime.now(),
        id: DateTime.now().toString());
    setState(() {
      _transactionLists.add(newTx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        NewTransaction(_addNewTransactions),
        TransactionList(_transactionLists),
      ],
    );
  }
}
