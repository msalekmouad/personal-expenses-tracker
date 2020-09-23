import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expenses_tracker/Classes/Transaction.dart';
import 'package:personal_expenses_tracker/Widgets/chart_bar.dart';

class ExpensesChart extends StatelessWidget {
  final List<Transaction> recentTransactions;

  ExpensesChart(this.recentTransactions);

  List<Map<String, Object>> get groupedTransactionValues{
    return List.generate(7, (index){
      final weekDay = DateTime.now().subtract(Duration(days: index,));

      double totalExpenses = 0;
      for (var value in recentTransactions) {
        if(value.date.day == weekDay.day && value.date.month == weekDay.month && value.date.year == weekDay.year){
          totalExpenses+= value.amount;
        }
      }

      return {
        'day': DateFormat.E().format(weekDay),
        'amount': totalExpenses
      };
    }).reversed.toList();
  }

  double get maxSpending{
    return groupedTransactionValues.fold(0.00, (sum, item){
      return sum + item['amount'];
    });
  }
  @override
  Widget build(BuildContext context) {
    var orientation = MediaQuery.of(context).orientation;
    var size = MediaQuery.of(context).size;

    return Card(
      child: recentTransactions.isEmpty ? Container(
        width: MediaQuery.of(context).size.width,
        height: orientation == Orientation.portrait ? 120 : size.height * 0.30,
        padding: EdgeInsets.all(30),
        child: Center(
          child: Text("Sorry no recent transactions", style: TextStyle(
            fontSize: 17,
          ),),
        ),
      ) : Container(
        margin: EdgeInsets.all(10),
        height: orientation == Orientation.portrait ? 110 : size.height * 0.50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: groupedTransactionValues.map((value) => Flexible(
            child: ChartBar(value['day'], value['amount'], (value['amount'] as double)/maxSpending, orientation == Orientation.portrait ? 110 : size.height * 0.50),
            fit: FlexFit.tight,
          )).toList(),
        ),
      ),
      elevation: 6,
    );
  }
}