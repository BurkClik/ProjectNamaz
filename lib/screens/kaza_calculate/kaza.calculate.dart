import 'package:flutter/material.dart';

class KazaCalculate extends StatefulWidget {
  @override
  _KazaCalculateState createState() => _KazaCalculateState();
}

class _KazaCalculateState extends State<KazaCalculate> {
  DateTime _dateTime;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          RaisedButton(
            child: Text('${_dateTime == null ? DateTime.now() : _dateTime}'),
            onPressed: () {
              showDatePicker(
                      context: context,
                      initialDate:
                          _dateTime == null ? DateTime.now() : _dateTime,
                      firstDate: DateTime(1920),
                      lastDate: DateTime(2021))
                  .then((date) {
                setState(() {
                  _dateTime = date;
                });
              });
            },
          )
        ],
      ),
    );
  }
}
