import 'package:flutter/material.dart';
import 'package:personal_expenses_tracker/Classes/Transaction.dart';

class ExpensesChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        margin: EdgeInsets.all(10),
        child: Text("Chart !!"),
        width: MediaQuery.of(context).size.width,
      ),
      elevation: 6,
    );
  }
}