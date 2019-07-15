import 'package:expense_tracker/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 500.0,
      child: transactions.isEmpty
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Waiting for your Expenses',
                  style: Theme.of(context).textTheme.title,
                ),
                SizedBox(
                  height: 24.0,
                ),
                Container(
                  height: 300.0,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            )
          : ListView.builder(
              itemBuilder: (context, index) {
                return Container(
                  child: Card(
                      child: Row(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Theme.of(context).primaryColor,
                                width: 2)),
                        margin: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 15),
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
