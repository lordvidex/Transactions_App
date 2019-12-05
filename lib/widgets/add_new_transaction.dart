import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addNewTransaction;

  NewTransaction(this.addNewTransaction);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();
  DateTime selectedDate;
  void _checkForErrors() {
    final titleGuy = titleController.text;
    final amountGuy = double.parse(amountController.text);

    if (titleGuy.isEmpty || amountGuy <= 0) {
      return;
    }
    widget.addNewTransaction(
      titleGuy,
      amountGuy,
      selectedDate == null ? DateTime.now() : selectedDate,
    );
    Navigator.of(context).pop();
  }

  void openDatePicker() {
    showDatePicker(
      context: context,
      firstDate: DateTime(2019),
      initialDate: DateTime.now(),
      lastDate: DateTime.now(),
    ).then((chosenDateFromPicker) {
      if (chosenDateFromPicker == null) {
        return;
      }
      setState(() {
        selectedDate = chosenDateFromPicker;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
          child: Card(
        elevation: 5,
        child: Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom + 10,
            top: 10,
            left: 10,
            right: 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              TextField(
                controller: titleController,
                onSubmitted: (_) => _checkForErrors,
                decoration: InputDecoration(
                  labelText: 'Title',
                ),
              ),
              TextField(
                onSubmitted: (_) => _checkForErrors,
                keyboardType:
                    TextInputType.numberWithOptions(signed: false, decimal: true),
                controller: amountController,
                decoration: InputDecoration(
                  labelText: 'Amount',
                ),
              ),
              //Add the DatePicker here
              Container(
                height: 70,
                child: Row(
                  children: <Widget>[
                    Text(
                      selectedDate == null
                          ? 'No date selected!'
                          : DateFormat.yMd().format(selectedDate),
                    ),
                    FlatButton(
                      onPressed: openDatePicker,
                      child: Text(
                        'Select Date',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).primaryColor),
                      ),
                    ),
                  ],
                ),
              ),

              RaisedButton(
                child: Text('Add Transaction'),
                color: Theme.of(context).primaryColor,
                textColor: Theme.of(context).textTheme.button.color,
                onPressed: _checkForErrors,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
