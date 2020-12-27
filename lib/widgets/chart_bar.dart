import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double sAmount;
  final double sAmountPct;
  ChartBar(this.label, this.sAmount, this.sAmountPct);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        FittedBox(
          child: Text('\$${sAmount.toStringAsFixed(0)}')),
        SizedBox(
          height: 5,
        ),
        Container(
          height: 100,
          width: 20,
          child: Stack(
            children: <Widget>[
              Container(
                  decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 1.0),
                color: Color.fromRGBO(220, 220, 220, 1),
                borderRadius: BorderRadius.circular(20),
              )),
              FractionallySizedBox(
                heightFactor: sAmountPct,
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColorDark,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Text(label)
      ],
    );
  }
}
