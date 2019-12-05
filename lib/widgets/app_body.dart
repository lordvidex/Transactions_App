import 'package:flutter/material.dart';

import '../models/transaction.dart';
import './chart.dart';

class AppBody extends StatefulWidget {
  AppBody({
    Key key,
    @required this.isPortrait,
    @required bool showChart,
    @required this.mediaQuery,
    @required this.appBar,
    @required List<Transaction> recentTransactions,
    @required this.txList,
  })  : _showChart = showChart,
        _recentTransactions = recentTransactions,
        super(key: key);

  final bool isPortrait;
   bool _showChart;
  final MediaQueryData mediaQuery;
  final AppBar appBar;
  final List<Transaction> _recentTransactions;
  final Container txList;

  @override
  _AppbodyState createState() => _AppbodyState();
}

class _AppbodyState extends State<AppBody> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        if (!widget.isPortrait)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text('Show Chart'),
              Switch(
                value: widget._showChart,
                onChanged: (val) {
                  setState(() {
                    widget._showChart = val;
                  });
                },
              ),
            ],
          ),
        if (widget.isPortrait)
          Container(
              height: (widget.mediaQuery.size.height -
                      widget.appBar.preferredSize.height -
                      widget.mediaQuery.padding.top) *
                  0.3,
              child: Chart(widget._recentTransactions)),
        if (widget.isPortrait) widget.txList,
        if (!widget.isPortrait)
          widget._showChart
              ? Container(
                  height: (widget.mediaQuery.size.height -
                          widget.appBar.preferredSize.height -
                          widget.mediaQuery.padding.top) *
                      0.7,
                  child: Chart(widget._recentTransactions))
              : widget.txList
      ],
    );
  }
}
