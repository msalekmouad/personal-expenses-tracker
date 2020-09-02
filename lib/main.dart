import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:personal_expenses_tracker/Widgets/expenses_chart.dart';
import 'package:personal_expenses_tracker/Widgets/transaction_list.dart';
import 'Classes/Transaction.dart';

import 'Widgets/form_pop_up.dart';

void main() {
  runApp(App());
}

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
        accentColor: Colors.deepPurple[500],
        primaryColor: Colors.deepPurple[600],
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
  bool showChart = false;

  void AddNewTransaction(Transaction tr) {
    setState(() {
      _userTransactions.add(tr);
    });
  }

  void RemoveTransaction(Transaction tr) {
    setState(() {
      _userTransactions.removeWhere((e) => e.id == tr.id);
    });
  }

  List<Transaction> get _recentTransactions {
    return _userTransactions
        .where((element) =>
            element.date.isAfter(DateTime.now().subtract(Duration(days: 7))))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var padding = MediaQuery.of(context).padding;
    var orientation = MediaQuery.of(context).orientation;
    var appBarHeight;
    return Scaffold(
        backgroundColor: Colors.grey[200],
        body: SafeArea(
            child: Column(
          children: [
            Container(
              height: orientation == Orientation.portrait ? size.height * 0.33: size.height * 0.23,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.deepPurple[600],
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "My Pocket",
                          style: TextStyle(
                              fontSize: 22,
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontFamily: 'Montserrat'),
                        ),
                        Spacer(),
                        if(orientation == Orientation.landscape)
                          Row(
                            children: [
                              Text("show chart", style: TextStyle(fontSize: 15, color: Colors.white),),
                              Switch.adaptive(value: showChart, onChanged: (val){
                                setState(() {
                                  showChart = val;
                                });
                              },)
                            ],
                          ),
                        FormPopUpButton(AddNewTransaction)
                      ],
                    ),
                   if(orientation == Orientation.portrait)
                      ExpensesChart(_userTransactions)
                  ],
                )
            ),
            if(orientation == Orientation.portrait || (orientation == Orientation.landscape && !showChart))
              TransactionList(
                  userTransactions: _userTransactions,
                  removeHandler: RemoveTransaction)
            else if (orientation == Orientation.landscape && showChart)
              Padding(child: ExpensesChart(_userTransactions), padding: EdgeInsets.all(10),)
          ],
        )));
  }
}
