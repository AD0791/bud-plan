import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double sAmount;
  final double sAmountPct;
  ChartBar(this.label, this.sAmount, this.sAmountPct);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (ctx, constraints) {
      return Column(
        children: <Widget>[
          Container(
            height: constraints.maxHeight*0.10,
            child: FittedBox(child: Text('\$${sAmount.toStringAsFixed(0)}')),
          ),
          SizedBox(
            height: constraints.maxHeight*0.05,
          ),
          Container(
            height: constraints.maxHeight*0.7,
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
            height: constraints.maxHeight*0.05,
          ),
          Container(
            height: constraints.maxHeight*0.10,
            child: FittedBox(child: Text(label)))
        ],
      );
    });
  }
}
