import 'package:flutter/material.dart';
import 'package:personal_expenses_tracker/Classes/Transaction.dart';

import 'ExpenseItem.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> userTransactions;
  final Function removeHandler;
  TransactionList({this.userTransactions, this.removeHandler});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height - 230,
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
          child: userTransactions.isEmpty ? Center(child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/poor.png', height: 200,),
              Text('No transactions available')
            ],
          ),) :ListView.builder(
            itemBuilder: (ctx, index){
              return ExpenseItem(userTransactions[index]);
            },
            itemCount: userTransactions.length,
            //children: [...userTransactions.map((e) => ExpenseItem(e)).toList()],
          ),
      ),
    );
  }
}


