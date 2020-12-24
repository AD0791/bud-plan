import 'package:bud_plan/models/transaction.dart';
import 'package:flutter/material.dart';
class TransactionList extends StatefulWidget {
  @override
  _TransactionListState createState() => _TransactionListState();
}

class _TransactionListState extends State<TransactionList> {
  final List<Transaction> _userTransactions = [
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
    return Container(
      
    );
  }
}