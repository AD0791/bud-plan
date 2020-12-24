import 'package:bud_plan/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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

  final titleController = TextEditingController();
  final amountController= TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter App'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[ Container(
            width: double.infinity,
            child: Card(
              color: Colors.blue,
               child: Text("Chart!!! "),
              elevation: 15,
            ),
          ),
          Card(
            child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(
                      labelText: "Title"
                    ),
                    controller: titleController,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      labelText: "Amount"
                    ),
                    controller: amountController,
                  ),
                  FlatButton(
                    onPressed: (){}, 
                    child: Text("Add Transaction"),
                    textColor: Colors.purple
                  )
                ],
              ),
            ),
            elevation: 15,  
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
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.purple,
                          width: 2,
                        ),
                      ),
                      padding: EdgeInsets.all(10),
                      child: Text('\$: ${taction.amount}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.purple 
                          ),
                      ),
                    ),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                        Text(
                          taction.title,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25
                          ),  
                        ),
                        Text(
                          DateFormat('yyyy/MM/dd').format(taction.date),
                          style: TextStyle(
                            color: Colors.grey
                          ),
                        ),
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
