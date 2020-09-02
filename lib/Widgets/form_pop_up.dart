import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expenses_tracker/Classes/Transaction.dart';
import 'expenses_chart.dart';

class FormPopUpButton extends StatefulWidget {
  final Function addHandler;
  FormPopUpButton(this.addHandler);
  @override
  _FormPopUpButtonState createState() => _FormPopUpButtonState(addHandler);
}

class _FormPopUpButtonState extends State<FormPopUpButton> {
  var titleController = TextEditingController();
  var amountController = TextEditingController();
  final Function addHandler;
  DateTime selectedDate;

  _FormPopUpButtonState(this.addHandler);

  void _showDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2019),
            lastDate: DateTime.now())
        .then((value) {
      if (value == null) return;
      setState(() {
        selectedDate = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var viewInsets = MediaQuery.of(context).viewInsets;
    var size = MediaQuery.of(context).size;

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
              return SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.only(
                      left: 10,
                      right: 10,
                      top: 10,
                      bottom: viewInsets.bottom + 10),
                  height: size.height * 0.9,
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
                              labelText: "Transaction amount",
                              hintText: "15.99"),
                          keyboardType: TextInputType.number,
                          controller: amountController,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(8),
                        height: 70,
                        child: Row(
                          children: [
                            Text(selectedDate == null
                                ? 'No date chosen'
                                : DateFormat()
                                    .add_yMMMd()
                                    .format(selectedDate)),
                            FlatButton(
                              textColor: Colors.deepPurple,
                              child: Text(
                                'Choose date',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              onPressed: _showDatePicker,
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8),
                        child: RaisedButton(
                          child: Text("Add Transaction"),
                          onPressed: () {
                            if (titleController.text.isEmpty ||
                                double.parse(amountController.text) <= 0)
                              return;
                            print(
                                'Title: ${titleController.text} | Amount: ${amountController.text}');
                            Transaction tr = Transaction(
                                id: DateTime.now().toString(),
                                title: titleController.text,
                                amount: double.parse(amountController.text),
                                date: selectedDate == null
                                    ? DateTime.now()
                                    : selectedDate);
                            addHandler(tr);
                            Navigator.of(context).pop();
                          },
                          textColor: Colors.white,
                          color: Colors.deepPurple,
                        ),
                      )
                    ],
                  ),
                ),
              );
            })
      },
    );
  }
}
