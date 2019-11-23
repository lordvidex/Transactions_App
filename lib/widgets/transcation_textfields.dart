import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addNewTransaction;

  NewTransaction(this.addNewTransaction);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void _checkForErrors() {
    final titleGuy = titleController.text;
    final amountGuy = double.parse(amountController.text);

    if (titleGuy.isEmpty || amountGuy <= 0) {
      return;
    }
    widget.addNewTransaction(
      titleGuy,
      amountGuy,
    );
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              controller: titleController,
              onSubmitted: (_)=>_checkForErrors,
              decoration: InputDecoration(
                labelText: 'Title',
              ),
            ),
            TextField(
              onSubmitted: (_)=>_checkForErrors,
              keyboardType:
                  TextInputType.numberWithOptions(signed: false, decimal: true),
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
              onPressed: _checkForErrors,
            )
          ],
        ),
      ),
    );
  }
}
