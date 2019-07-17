import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();
  DateTime _selectedDate;
  final _amountController = TextEditingController();

  void _submitData() {
    final enteredTitle = _titleController.text;
    final enteredAmount = double.parse(_amountController.text);
    if (_amountController == null) {
      return;
    }
    if (enteredTitle.isEmpty || enteredAmount <= 0 || _selectedDate == null) {
      return;
    }
    widget.addTx(
      enteredTitle,
      enteredAmount,
      _selectedDate,
    );
    Navigator.of(context).pop();
  }

  void _datePicker() {
    showDatePicker(
      context: context,
      firstDate: DateTime(2019),
      initialDate: DateTime.now(),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      } else {
        setState(() {
          _selectedDate = pickedDate;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                labelText: 'Title',
              ),
              controller: _titleController,
              onSubmitted: (_) => _submitData(),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Amount',
              ),
              controller: _amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => _submitData(),
            ),
            Row(
              children: <Widget>[
                Text(
                  _selectedDate == null
                      ? 'No Data Chosen'
                      : 'Picked Date : ${DateFormat.yMd().format(_selectedDate)}',
                  style: Theme.of(context).textTheme.subtitle,
                ),
                Spacer(),
                FlatButton(
                  onPressed: _datePicker,
                  textColor: Theme.of(context).accentColor,
                  child: Text(
                    'Choose Date',
                    style: TextStyle(fontSize: 15.0),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            RaisedButton(
              elevation: 5,
              onPressed: () => _submitData(),
              child: Text('Add Transaction'),
              textColor: Theme.of(context).buttonColor,
              color: Theme.of(context).primaryColor,
              splashColor: Colors.purpleAccent[700],
            )
          ],
        ),
      ),
    );
  }
}
