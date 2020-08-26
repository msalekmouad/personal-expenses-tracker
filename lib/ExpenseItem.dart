import 'package:flutter/material.dart';
import 'package:personal_expenses_tracker/Classes/Transaction.dart';

class ExpenseItem extends StatelessWidget {
  final Transaction transaction;
  ExpenseItem(this.transaction);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 6),
      child: Card(
        elevation: 2,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Text(transaction.amount.toString() + ' \$', style: TextStyle(letterSpacing: 1.2, fontWeight: FontWeight.bold, color: Colors.deepPurple)),
                margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              ),
              Column(children: [
                Text(transaction.title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                Text(transaction.date.toString(), style: TextStyle(color: Colors.grey[600])),
              ],
                crossAxisAlignment: CrossAxisAlignment.start,),
              IconButton(
                icon: Icon(
                  Icons.delete,
                  color: Colors.red[500],
                ),
                onPressed: null,
              )
            ],
          ),
        ),
      ),
    );
  }
}
