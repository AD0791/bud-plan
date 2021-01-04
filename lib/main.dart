import './widgets/transaction_list.dart';
import './widgets/new_transaction.dart';
import './models/transaction.dart';
import './widgets/chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// scenario if i want to serve my app with potrait mode only
void main(){
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitDown
  ]);
  runApp(MyBudgetPlanner());
}

//void main() => runApp(MyBudgetPlanner());

class MyBudgetPlanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Budget',
      home: MyHomePage(),
      theme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.amber,
        errorColor: Colors.red,
        fontFamily: "Quicksand",
        textTheme: ThemeData.light().textTheme.copyWith(
          title: TextStyle(
            fontFamily: "OpenSans",
            fontSize: 18,
            fontWeight: FontWeight.bold
          ),
          button: TextStyle(color: Colors.white),    
        ),
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(
              title: TextStyle(
                  fontFamily: "OpenSans",
                  fontSize: 25,
                  fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _userTransactions = [
    // Transaction(
    //     id: "1", title: "Barner Glass", amount: 59.99, date: DateTime.now()),
    // Transaction(
    //     id: "2",
    //     title: "Razoire Electric",
    //     amount: 19.99,
    //     date: DateTime.now()),
  ];

  List<Transaction> get _recentTx{
    return _userTransactions.where((element) => element.date.isAfter(
        DateTime.now().subtract(
          Duration(days: 7,)
        )
      ),
    ).toList();
  }

  // the model news
  void _addNewTransaction(String title, double amount, DateTime chosenDate) {
    final newTaction = Transaction(
        title: title,
        amount: amount,
        date: chosenDate,
        id: DateTime.now().toString());
    setState(() {
      _userTransactions.add(newTaction);
    });
  }

  void _startaddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {},
              child: NewTransaction(_addNewTransaction));
        });
  }

  void _deleteTransaction(String id){
    setState(() {
      _userTransactions.removeWhere((tx) => 
        tx.id == id 
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
        title: Text('Personal Budget'),
        //style: TextStyle(
        // fontFamily: "Open Sans"
        //)
        centerTitle: true,
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.add,
              ),
              onPressed: () => _startaddNewTransaction(context))
        ],
      );
    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[   
            Container(
              height: (MediaQuery.of(context).size.height
               - appBar.preferredSize.height
               - MediaQuery.of(context).padding.top) * 0.35,
              child: Chart(_recentTx)),
            Container(
              height: (MediaQuery.of(context).size.height
               - appBar.preferredSize.height
               - MediaQuery.of(context).padding.top) * 0.65,
              child: TransactionList(_userTransactions, _deleteTransaction)),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
        ),
        onPressed: () => _startaddNewTransaction(context),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
