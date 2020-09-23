import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expenses_tracker/Classes/Transaction.dart';

class ExpenseItem extends StatelessWidget {
  final Transaction transaction;
  final Function removeItem;
  ExpenseItem(this.transaction, this.removeItem);
  
  Widget _deleteButton(){
    return IconButton(
      focusColor: Colors.red[300],
      icon: Icon(
        Icons.delete,
        color: Colors.red[500],
      ),
      onPressed: () {
        removeItem(transaction);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var orientation = MediaQuery.of(context).orientation;

    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 6),
        child: Card(
          elevation: 2,
          margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
          child: ListTile(
            leading: CircleAvatar(
                backgroundColor: Colors.deepPurple[400],
                radius: 30,
                child: Padding(
                  padding: EdgeInsets.all(6),
                  child: FittedBox(
                    child: Text('\$${transaction.amount}',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            letterSpacing: 1.2, fontWeight: FontWeight.bold)),
                  ),
                )),
            title: Text(
              transaction.title,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            subtitle: Text(DateFormat().add_yMMMd().format(transaction.date),
                style: TextStyle(color: Colors.grey[600], fontSize: 14)),
            trailing: orientation == Orientation.portrait ? _deleteButton() : FittedBox(child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text("DELETE", style: TextStyle(fontSize: 12, color: Colors.red[500], fontWeight: FontWeight.bold),),
                _deleteButton()
              ],),
            ),
          ),
        ));
  }
}
