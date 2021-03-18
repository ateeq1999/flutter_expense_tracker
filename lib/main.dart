import './widgets/chart.dart';
import 'package:flutter/material.dart';
import './widgets/new_transaction.dart';
import './widgets/transaction_list.dart';
import './models/transaction.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expense Tracker',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.amber,
        fontFamily: 'Cairo',
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(
                title: TextStyle(
                  fontFamily: 'Cairo',
                ),
              ),
        ),
        // textTheme: TextTheme(title: )
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _userTransations = [
    // Transaction(
    //   id: 't1',
    //   title: 'new Shose',
    //   amount: 19.00,
    //   date: DateTime.now(),
    // ),
    // Transaction(
    //   id: 't2',
    //   title: 'coffee',
    //   amount: 10.00,
    //   date: DateTime.now(),
    // ),
  ];

  List<Transaction> get _recentTransactions {
    return _userTransations.where(
      (tx) {
        return tx.date.isAfter(
          DateTime.now().subtract(
            Duration(days: 7),
          ),
        );
      },
    ).toList();
  }

  void _addNewTransaction(String txTitle, double txAmount) {
    final newTx = Transaction(
      id: DateTime.now().toString(),
      title: txTitle,
      amount: txAmount,
      date: DateTime.now(),
    );

    setState(() {
      _userTransations.add(newTx);
    });
  }

  void _startAddNewTransaction(ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return NewTransaction(_addNewTransaction);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expense Tracker App'),
        actions: [
          IconButton(
            icon: Icon(
              Icons.add,
            ),
            onPressed: () => _startAddNewTransaction(
              context,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Chart(_recentTransactions),
            TransactionList(
              _userTransations,
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).accentColor,
        onPressed: () => _startAddNewTransaction(
          context,
        ),
        child: Icon(
          Icons.add,
        ),
      ),
    );
  }
}
