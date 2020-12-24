import 'package:flutter/foundation.dart';
class Transaction {
  final String id;
  final String title;
  final double amount;
  DateTime date;
  Transaction({
    @required this.id,
    @required this.title,
    @required this.amount,
    @required this.date
  });
}





















/* bad practice Situation

    # Situation 1

    String inputA;
    String inputT;
    >> after we hit the onchange on the textfield
    onChanged: (value)=> inputA/inputB = value,

    # Situation 2
    final titleController = TextEditingController();
    final amountController= TextEditingController();
    in the text field we use them 
    controller: titleController/amountController,
    # we have the same behavior as the previous situation
*/