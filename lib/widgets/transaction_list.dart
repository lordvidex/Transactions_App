import 'package:flutter/material.dart';

import '../models/transaction.dart';
import './transaction_list_item.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;
  const TransactionList(this.transactions,this.deleteTx);
  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? LayoutBuilder(builder: (ctx,constraints){
            return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                height: constraints.maxHeight*0.1,
                child: Text(
                  'There are currently no transactions!',
                  style: Theme.of(context).textTheme.title,
                ),
              ),
              SizedBox(
                height: constraints.maxHeight*0.1,
              ),
              Container(
                height: constraints.maxHeight*0.6,
                child: Image.asset('assets/images/waiting.png',
                    fit: BoxFit.cover),
              ),
               SizedBox(
                height: constraints.maxHeight*0.2,
              ),
            ],
          );
        },)
        : ListView.builder(
            itemCount: transactions.length,
            itemBuilder: (cont, index) {
              return TransactionListItem(transactions: transactions, index: index, deleteTx:deleteTx,);
            },
          );
  }
}
