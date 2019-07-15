import 'package:expense_tracker/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500.0,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return Container(
            child: Card(
                child: Row(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: Theme.of(context).primaryColor, width: 2)),
                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15),
                  child: Text(
                    '\$ ' + transactions[index].amount.toStringAsFixed(2),
                    style: Theme.of(context).textTheme.subhead,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      transactions[index].title,
                      style: Theme.of(context).textTheme.title,
                    ),
                    Text(
                      DateFormat.yMMMd().format(transactions[index].date),
                      style: TextStyle(
                        color: Colors.grey,
                        fontFamily: 'Pacifico',
                      ),
                    )
                  ],
                )
              ],
            )),
          );
        },
        itemCount: transactions.length,
      ),
    );
  }
}
