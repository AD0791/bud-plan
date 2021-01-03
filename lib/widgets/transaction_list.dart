//import 'package:bud_plan/models/transaction.dart';
import 'package:bud_plan/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;
  TransactionList(this.transactions, this.deleteTx);

  @override
  Widget build(BuildContext context) {
        // set the height for  the scrollview situation
    return transactions.isEmpty
            ? Column(children: <Widget>[
                Text(
                  "No transaction added yet",
                  style: Theme.of(context).textTheme.title,
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 300,
                  child: Image.asset(
                    "assets/images/image/waiting.png",
                    fit: BoxFit.cover,
                  ),
                )
              ])
            : ListView.builder(
                itemBuilder: (ctx, index) {
                  // return Card(
                  //   child: Row(
                  //     children: <Widget>[
                  //       Container(
                  //         margin: EdgeInsets.symmetric(
                  //             vertical: 10, horizontal: 15),
                  //         decoration: BoxDecoration(
                  //           border: Border.all(
                  //             color: Theme.of(context).primaryColor,
                  //             width: 2,
                  //           ),
                  //         ),
                  //         padding: EdgeInsets.all(10),
                  //         child: Text(
                  //           '\$: ${transactions[index].amount.toStringAsFixed(2)}',
                  //           style: TextStyle(
                  //               fontWeight: FontWeight.bold,
                  //               fontSize: 15,
                  //               color: Theme.of(context).primaryColor),
                  //         ),
                  //       ),
                  //       Column(
                  //         crossAxisAlignment: CrossAxisAlignment.start,
                  //         children: <Widget>[
                  //           Text(
                  //             transactions[index].title,
                  //             style: Theme.of(context).textTheme.title,
                  //           ),
                  //           Text(
                  //             DateFormat('yyyy/MM/dd')
                  //                 .format(transactions[index].date),
                  //             style: TextStyle(color: Colors.grey),
                  //           ),
                  //         ],
                  //       ),
                  //     ],
                  //   ),
                  //   elevation: 15,
                  // );
                  return Card(
                    elevation: 15,
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 30,
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: FittedBox(
                              child: Text(
                            '\$: ${transactions[index].amount.toStringAsFixed(2)}',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,),
                          )),
                        ),
                      ),
                      title: Text(
                        transactions[index].title,
                        style: Theme.of(context).textTheme.title,
                      ),
                      subtitle: Text(
                        DateFormat.yMMMd().format(transactions[index].date)),
                      trailing: IconButton(icon: Icon(Icons.delete),
                        color: Theme.of(context).errorColor,
                        onPressed: (){
                          deleteTx(transactions[index].id);
                        },
                      ),
                    ),
                  );
                },
                itemCount: transactions.length,
              );
  }
}
