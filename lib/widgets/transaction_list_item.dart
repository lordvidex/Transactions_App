import 'dart:math';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

import '../models/transaction.dart';

class TransactionListItem extends StatefulWidget {
  const TransactionListItem({
    Key key,
    @required this.transactions,
    @required this.index,
    @required this.deleteTx,
  }) : super(key: key);

  final List<Transaction> transactions;
  final int index;
  final Function deleteTx;

  @override
  _TransactionListItemState createState() => _TransactionListItemState();
}

class _TransactionListItemState extends State<TransactionListItem> {
  Color _bgColor;
  @override
  void initState() {
    const List<Color>colors = [Colors.red,Colors.blue,Colors.green,Colors.purple,];
    _bgColor = colors[Random().nextInt(colors.length)];
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(vertical: 4, horizontal: 4),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: _bgColor,
          radius: 30,
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: FittedBox(
                child: Text(
                    "\$${widget.transactions[widget.index].amount.toStringAsFixed(2)}")),
          ),
        ),
        title: Text(
          widget.transactions[widget.index].title,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          DateFormat('MMM dd, yyyy')
              .format(widget.transactions[widget.index].date),
        ),
        trailing: MediaQuery.of(context).size.width>460?
        FlatButton.icon(
          onPressed: () => widget.deleteTx(widget.transactions[widget.index].id),
          icon: Icon(
            Icons.delete,
            color: Theme.of(context).errorColor,
          ),
          label: Text('Delete'),
          textColor: Theme.of(context).errorColor,
        )
        :IconButton(
          icon: Icon(
            Icons.delete,
            color: Theme.of(context).errorColor,
          ),
          onPressed: () => widget.deleteTx(widget.transactions[widget.index].id),
        ),
      ),
    );
  }
}
