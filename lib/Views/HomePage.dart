import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:personal_expenses_tracker/Classes/Transaction.dart';
import 'package:personal_expenses_tracker/Widgets/expenses_chart.dart';
import 'package:personal_expenses_tracker/Widgets/form_pop_up.dart';
import 'package:personal_expenses_tracker/Widgets/transaction_list.dart';

//Home Widget
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

//Home State
class _HomePageState extends State<HomePage> with WidgetsBindingObserver {
  final List<Transaction> _userTransactions = [];
  bool showChart = false;

  //#region Methods
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
  //#endregion

  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // TODO: implement didChangeAppLifecycleState
    print(state);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var padding = MediaQuery.of(context).padding;
    var orientation = MediaQuery.of(context).orientation;

    return Scaffold(
        backgroundColor: Colors.grey[200],
        body: SafeArea(
            child: Column(
              children: [
                Container(
                    height: orientation == Orientation.portrait ? size.height * 0.34: size.height * 0.23,
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