import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double amount;
  final double total;
  final double pHeight;

  ChartBar(this.label, this.amount, this.total, this.pHeight);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height:  pHeight * 0.10,
          child:  FittedBox(
            child: Text('\$${amount.toStringAsFixed(0)}', style: TextStyle(fontSize: 5),),
          ),
        ),
        SizedBox(
          height: pHeight * 0.05,
        ),
        Container(
          height:  pHeight * 0.50,
          width: 10,
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1.0),
                    color: Color.fromARGB(220, 220, 220, 1),
                    borderRadius: BorderRadius.circular(20)),
              ),
              FractionallySizedBox(
                heightFactor: total,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.deepPurple[300],
                      borderRadius: BorderRadius.circular(20)),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: pHeight * 0.05,
        ),
        Container(
          height:  pHeight * 0.10,
          child:  FittedBox(
            child: Text(label),
          ),
        )
      ],
    );
  }
}
