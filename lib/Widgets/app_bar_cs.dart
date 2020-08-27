import 'package:flutter/material.dart';
import 'package:personal_expenses_tracker/Classes/Transaction.dart';
import '../Clippers/AppBarClipper.dart';
import 'expenses_chart.dart';

class AppBarCs extends StatelessWidget {
  final Function addHandler;
  final List<Transaction> transactions;
  AppBarCs(this.addHandler, this.transactions);

  @override
  Widget build(BuildContext context) {
    return Stack(
      overflow: Overflow.visible,
      children: [
        Container(
            padding: EdgeInsets.all(20),
            height: 150,
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
                          fontFamily: 'Montserrat'
                      ),
                    ),
                    FormPopUpButton(addHandler)
                  ],
                ),
              ],
            )),
        Positioned(
          child: Padding(
            child: ExpensesChart(transactions),
            padding: EdgeInsets.symmetric(vertical: 0, horizontal: 15),
          ),
          bottom: -60,
          left: 0,
          right: 0,
        )
      ],
    );
  }
}

// ignore: must_be_immutable
class FormPopUpButton extends StatelessWidget {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  final Function addHandler;
  FormPopUpButton(this.addHandler);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.add,
        color: Colors.white,
      ),
      tooltip: 'Add New Expense',
      onPressed: () => {
        showModalBottomSheet(
            isDismissible: false,
            context: context,
            builder: (BuildContext bc) {
              return Container(
                padding: EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.attach_money,
                          color: Colors.deepPurple,
                        ),
                        Text(
                          "New Transaction",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.deepPurple),
                        ),
                        Spacer(),
                        IconButton(
                          onPressed: () => {Navigator.of(context).pop()},
                          color: Colors.red,
                          icon: Icon(Icons.close),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        decoration: InputDecoration(
                            labelText: "Transaction title",
                            hintText: "Scuba diving"),
                        controller: titleController,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        decoration: InputDecoration(
                            labelText: "Transaction amount", hintText: "15.99"),
                        keyboardType: TextInputType.number,
                        controller: amountController,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8),
                      child: FlatButton(
                        child: Text("Add Transaction"),
                        onPressed: () {
                          if(titleController.text.isEmpty || double.parse(amountController.text) <= 0) return;
                          print(
                              'Title: ${titleController.text} | Amount: ${amountController.text}');
                          Transaction tr = Transaction(
                              id: DateTime.now().toString(),
                              title: titleController.text,
                              amount: double.parse(amountController.text),
                              date: DateTime.now());
                          addHandler(tr);
                          Navigator.of(context).pop();
                        },
                        textColor: Colors.deepPurple,
                      ),
                    )
                  ],
                ),
              );
            })
      },
    );
  }
}
