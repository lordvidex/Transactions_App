import '../models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
              return Card(
                elevation: 5,
                margin: EdgeInsets.symmetric(vertical: 4, horizontal: 4),
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: FittedBox(
                          child: Text(
                              "\$${transactions[index].amount.toStringAsFixed(2)}")),
                    ),
                  ),
                  title: Text(
                    transactions[index].title,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    DateFormat('MMM dd, yyyy')
                        .format(transactions[index].date),
                  ),
                  trailing: IconButton(
                    icon: Icon(
                      Icons.delete,
                      color: Theme.of(context).errorColor,
                    ),
                    onPressed: () => deleteTx(transactions[index].id),
                  ),
                ),
              );
            },
          );
  }
}
