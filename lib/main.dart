import 'package:flutter/material.dart';

import './widgets/transaction_list.dart';
import './widgets/add_new_transaction.dart';
import './widgets/chart.dart';
import './models/transaction.dart';
import './widgets/app_body.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.purple,
        fontFamily: 'Quicksand',
        textTheme: ThemeData.light().textTheme.copyWith(
              title: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'OpenSans',
                fontSize: 18,
              ),
              button: TextStyle(color: Colors.white),
            ),
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(
                title: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'OpenSans',
                  fontSize: 20,
                ),
                button: TextStyle(color: Colors.white),
              ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      title: 'Expenses App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //original lists all time

  final List<Transaction> _transactionLists = [];
  bool _showChart = false;
  //getting the recent transaction lists

  List<Transaction> get _recentTransactions {
    return _transactionLists.where((transaction) {
      return transaction.date.isAfter(
        DateTime.now().subtract(
          Duration(days: 7),
        ),
      );
    }).toList();
  }

  void _addNewTransactions(
      String txTitle, double txAmount, DateTime selectedDate) {
    final newTx = Transaction(
        title: txTitle,
        amount: txAmount,
        date: selectedDate,
        id: DateTime.now().toString());
    setState(() {
      _transactionLists.add(newTx);
    });
  }

  void startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          behavior: HitTestBehavior.opaque,
          child: NewTransaction(_addNewTransactions),
        );
      },
    );
  }

  void _deleteTransaction(String id) {
    setState(() {
      _transactionLists.removeWhere((tx) => tx.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final bool isPortrait = mediaQuery.orientation == Orientation.portrait;

    //Appbar separated so that we can calculate the available space left
    //when assigning our mainPage size....
    final appBar = AppBar(
      elevation: 0.0,
      backgroundColor: Theme.of(context).primaryColorLight,
      actions: <Widget>[
        IconButton(
          onPressed: () => startAddNewTransaction(context),
          icon: Icon(Icons.add),
        )
      ],
      title: const Text(
        'Expenses App',
        style: TextStyle(
          fontFamily: 'OpenSans',
        ),
      ),
    );

    final txList = Container(
      height: (mediaQuery.size.height -
              appBar.preferredSize.height -
              mediaQuery.padding.top) *
          0.7,
      child: TransactionList(_transactionLists, _deleteTransaction),
    );

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () => startAddNewTransaction(context),
        child: const Icon(Icons.add),
      ),
      appBar: appBar,
      body: new AppBody(
          isPortrait: isPortrait,
          showChart: _showChart,
          mediaQuery: mediaQuery,
          appBar: appBar,
          recentTransactions: _recentTransactions,
          txList: txList),
    );
  }
}