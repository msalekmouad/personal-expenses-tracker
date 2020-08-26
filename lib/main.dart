import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:personal_expenses_tracker/Widgets/transaction_list.dart';
import 'Classes/Transaction.dart';

import 'Widgets/app_bar_cs.dart';

void main() => runApp(App());

//Main App Widget
class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Change status bar color
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor:
          Colors.deepPurple[600], //or set color with: Color(0xFF0000FF)
    ));
    return MaterialApp(
      title: "My Pocket",
      theme: ThemeData(
        fontFamily: 'Montserrat',
        accentColor: Colors.deepPurple,
        primaryColor: Colors.deepPurple[600]
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

//Home Page
class _HomePageState extends State<HomePage> {

  final List<Transaction> _userTransactions = [
    /*Transaction(
        id: 't1', title: 'New Shoes', amount: 69.99, date: DateTime.now()),
    Transaction(
        id: 't2', title: 'Fixing Laptop', amount: 152.75, date: DateTime.now()),
    Transaction(
        id: 't3', title: 'Lol skin', amount: 25.00, date: DateTime.now()),*/
  ];

  void AddNewTransaction(Transaction tr){
    setState(() {
      _userTransactions.add(tr);
    });
  }

  void RemoveTransaction(Transaction tr){
    setState(() {
      _userTransactions.remove(tr);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        body: SafeArea(
            child: Column(
              children: [
                AppBarCs(AddNewTransaction),
                TransactionList(userTransactions: _userTransactions, removeHandler: RemoveTransaction,)
              ],
            )
        )
    );
  }
}

