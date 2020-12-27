import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;
  Chart(this.recentTransactions);
  List<Map<String,Object>> get gTransactionValues {
    return List.generate(7,(index){
      final weekDay = DateTime.now().substract(
        Duration(days: index,)
      )
      double totalSum = 0.0;
      for(var i =0;i<recentTransactions.length;i++){
        if(recenTransactions[i].date.day == weekDay.day &&
          recenTransactions[i].date.month == weekDay.month &&
          recenTransactions[i].date.year == weekDay.year
        ){
          totalSum += recentTransaction[i].amount;
        }
      }
      return {'day': DateFormat.E(weekDay).substring(0,1)
      , 'amount': totalSum};
    });
  }


  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 20,
      margin: EdgeInsets.all(20),
      child: Row(
        children: gTransactionValues.map((data) =>
          Text('${data["day"]}: ${data["amount"].toString()}')
        ).toList(),
      ),
    );
  }
}