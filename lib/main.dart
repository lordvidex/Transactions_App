import 'package:expenses_app/widgets/list_and_input_merge.dart';
import 'package:expenses_app/widgets/transcation_textfields.dart';

import './widgets/transaction_list.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expenses App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Expenses App'),
        ),
        body: SingleChildScrollView(
                  child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Card(
                color: Colors.blue,
                child: Text('Chart'),
              ),
              ListAndInputMerge(),
            ],
          ),
        ),
      ),
    );
  }
}
