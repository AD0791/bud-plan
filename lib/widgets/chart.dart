import 'package:flutter/material.dart';
import '../models/transaction.dart';
import './chart_bar.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;
  Chart(this.recentTransactions);

  List<Map<String, Object>> get gTransactionValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(
        days: index,
      ));
      double totalSum = 0.0;
      for (var i = 0; i < recentTransactions.length; i++) {
        if (recentTransactions[i].date.day == weekDay.day &&
            recentTransactions[i].date.month == weekDay.month &&
            recentTransactions[i].date.year == weekDay.year) {
          totalSum += recentTransactions[i].amount;
        }
      }
      return {
        'day': DateFormat.E().format(weekDay).substring(0, 1),
        'amount': totalSum
      };
    }).reversed.toList();
  }

  double get tSpending {
    return gTransactionValues.fold(
        0.0, (sum, element) => sum + element["amount"]);
  }

  @override
  Widget build(BuildContext context) {
    // to see if the amount increese
    //print(gTransactionValues);
    return  Card(
        elevation: 20,
        margin: EdgeInsets.all(20),
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: gTransactionValues.map((data) {
              return Flexible(
                fit: FlexFit.tight,
                child: ChartBar(
                    data['day'],
                    data["amount"],
                    tSpending == 0.0
                        ? 0.0
                        : (data['amount'] as double) / tSpending),
              );
            }).toList(),
          ),
        ),
      );
  }
}
