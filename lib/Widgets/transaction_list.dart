import 'package:flutter/material.dart';
import 'package:personal_expenses_tracker/Classes/Transaction.dart';

import 'ExpenseItem.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> userTransactions;
  final Function removeHandler;
  TransactionList({this.userTransactions, this.removeHandler});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var orientation = MediaQuery.of(context).orientation;

    return SingleChildScrollView(
      child: Container(
        height: size.height * 0.62,
        padding: EdgeInsets.all(10),
        child: userTransactions.isEmpty
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/poor.png',
                      height: orientation == Orientation.landscape ? 80 : 200,
                    ),
                    Text('No transactions available'),
                  ],
                ),
              )
            : ListView.builder(
                itemBuilder: (ctx, index) {
                  return ExpenseItem(userTransactions[index], removeHandler);
                },
                itemCount: userTransactions.length,
                //children: [...userTransactions.map((e) => ExpenseItem(e)).toList()],
              ),
      ),
    );
  }
}
