import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expenses_tracker/Classes/Transaction.dart';

class ExpenseItem extends StatelessWidget {
  final Transaction transaction;
  ExpenseItem(this.transaction);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 6),
      child: Card(
        elevation: 3,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                child: Text('\$${transaction.amount}',textAlign: TextAlign.center, style: TextStyle(letterSpacing: 1.2, fontWeight: FontWeight.bold, color: Colors.deepPurple)),
                margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                width: 75,
                decoration: BoxDecoration(
                  border: Border.all(
                    style: BorderStyle.solid,
                    color: Colors.deepPurple,
                    width: 1
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(10)),

                ),
                padding: EdgeInsets.symmetric(
                  vertical: 6,
                  horizontal: 3
                ),
              ),
              SizedBox(width: 10),
              Column(
                children: [
                Text(transaction.title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                Text(DateFormat().add_yMMMd().format(transaction.date), style: TextStyle(color: Colors.grey[600], fontSize: 14)),
              ],
                crossAxisAlignment: CrossAxisAlignment.start,
              ),
              Spacer(),
              IconButton(
                icon: Icon(
                  Icons.delete,
                  color: Colors.red[500],
                ),
                onPressed: (){
                  //removeHandler(transaction);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
