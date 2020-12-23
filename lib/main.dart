import 'package:flutter/material.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter App'),
        centerTitle: true,
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center ,
          children: <Widget>[ Container(
            width: double.infinity,
            child: Card(
              color: Colors.blue,
               child: Text("Chart!!! "),
              elevation: 5,
            ),
          ),
          Card(
            color: Colors.red,
            child: Text("List of transactions"),
          ),
        ],
      ),
    );
  }
}
