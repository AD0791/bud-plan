import 'package:flutter/material.dart';
import '../widgets/new_transaction.dart';
import '../widgets/transaction_list.dart';
import '../models/transaction.dart';
class UserTransaction extends StatefulWidget {
  @override
  _UserTransactionState createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
  final List<Transaction> _userTransactions = [
    Transaction(
        id: "1", title: "Barner Glass", amount: 59.99, date: DateTime.now()),
    Transaction(
        id: "2",
        title: "Razoire Electric",
        amount: 19.99,
        date: DateTime.now()),
  ];

  // the model news
  void _addNewTransaction(String title,double amount){
    final newTaction = Transaction(title: title,
      amount: amount, 
      date: DateTime.now(),
      id: DateTime.now().toString()
    );
    setState(() {
      _userTransactions.add(newTaction);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        NewTransaction(_addNewTransaction),
        TransactionList(_userTransactions),
      ],
    );
  }
}