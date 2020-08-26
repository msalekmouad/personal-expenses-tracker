import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:personal_expenses_tracker/Classes/Transaction.dart';
import 'package:personal_expenses_tracker/ExpenseItem.dart';

import 'Clippers/AppBarClipper.dart';

void main() => runApp(App());

//Main App Widget
class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor:
          Colors.deepPurple[600], //or set color with: Color(0xFF0000FF)
    ));

    return MaterialApp(
      title: "My Pocket",
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction(
        id: 't1', title: 'New Shoes', amount: 69.99, date: DateTime.now()),
    Transaction(
        id: 't2', title: 'Fixing Laptop', amount: 152.75, date: DateTime.now()),
    Transaction(
        id: 't3', title: 'Lol skin', amount: 25.00, date: DateTime.now()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        body: SafeArea(
            child: Column(
          children: [
            AppBarCs(),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 30, horizontal: 15),
              child: Column(
                children: [
                  ...transactions
                      .map((e) => ExpenseItem(e))
                      .toList()
                ],
              ),
            )
          ],
        )));
  }
}

class ExpensesChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        child: Text("Chart !!"),
        width: MediaQuery.of(context).size.width,
      ),
      elevation: 1,
    );
  }
}

class AppBarCs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: AppBarClipper(),
      child: Container(
          padding: EdgeInsets.all(20),
          height: 200,
          decoration: BoxDecoration(
            color: Colors.deepPurple[600],
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "My Pocket",
                    style: TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Montserrat'),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                    tooltip: 'Add New Expense',
                    onPressed: null,
                  )
                ],
              ),
              ExpensesChart()
            ],
          )),
    );
  }
}
