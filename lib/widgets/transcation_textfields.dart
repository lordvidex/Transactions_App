import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function addNewTransaction;
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  NewTransaction(this.addNewTransaction);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView (
          child: Card(
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              TextField(
                controller: titleController,
                decoration: InputDecoration(
                  labelText: 'Title',
                ),
              ),
              TextField(
                controller: amountController,
                decoration: InputDecoration(
                  labelText: 'Amount',
                ),
              ),
              FlatButton(
                child: Text(
                  'Add Transaction',
                  style: TextStyle(color: Colors.purple),
                ),
                onPressed: () {
                  addNewTransaction(
                      titleController.text, double.parse(amountController.text));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
