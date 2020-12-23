import 'package:bud_plan/transaction.dart';
import 'package:flutter/material.dart';
import './transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction(id:"1", 
      title: "Barner Glass", 
      amount: 59.99, 
      date: DateTime.now()
      ),
      Transaction(id:"2", 
      title: "Razoire Electric", 
      amount: 19.99, 
      date: DateTime.now()
      ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter App'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[ Container(
            width: double.infinity,
            child: Card(
              color: Colors.blue,
               child: Text("Chart!!! "),
              elevation: 15,
            ),
          ),
          Column(
            children: transactions.map((taction) => 
              Card(child: Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 15
                      ),
                      child: Text('${taction.amount} \$'),
                    ),
                    Column(children: <Widget>[
                        Text(taction.title),
                        Text(taction.date.toString()),
                      ],
                    ),
                  ],
                ),
                elevation: 15,
              )
            ).toList(),
          ),
        ],
      ),
    );
  }
}
