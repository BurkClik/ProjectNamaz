import 'package:flutter/material.dart';
import 'package:namaz_project_x/models/times.dart';
import 'package:namaz_project_x/theme/constant.dart';
import 'package:namaz_project_x/models/weekdays_model.dart';
import 'package:intl/intl.dart';

class TimeTable extends StatefulWidget {
  @override
  _TimeTableState createState() => _TimeTableState();
}

class _TimeTableState extends State<TimeTable> {
  Weekdays days = new Weekdays();
  Times weeklyTimes = new Times();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 38.0, left: 8.0, right: 8.0),
      child: Table(
        border: TableBorder(
          horizontalInside: BorderSide(),
        ),
        defaultColumnWidth: IntrinsicColumnWidth(),
        children: [
          TableRow(
            children: [
              TableCell(
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(''),
                ),
              ),
              Text('İmsak', style: kVakitTextStyle),
              //Text('Güneş', style: kVakitTextStyle),
              Text('Öğle', style: kVakitTextStyle),
              Text('İkindi', style: kVakitTextStyle),
              Text('Akşam', style: kVakitTextStyle),
              Text('Yatsı', style: kVakitTextStyle),
            ],
          ),
          buildTableRow(days.getWeekdays()[0], weeklyTimes.getTimes()),
          buildTableRow(days.getWeekdays()[1], weeklyTimes.getTimes()),
          buildTableRow(days.getWeekdays()[2], weeklyTimes.getTimes()),
          buildTableRow(days.getWeekdays()[3], weeklyTimes.getTimes()),
          buildTableRow(days.getWeekdays()[4], weeklyTimes.getTimes()),
          buildTableRow(days.getWeekdays()[5], weeklyTimes.getTimes()),
          buildTableRow(days.getWeekdays()[6], weeklyTimes.getTimes()),
        ],
      ),
    );
  }

  TableRow buildTableRow(String day, List time) {
    return TableRow(
      children: [
        TableCell(
          child: Container(
            padding: day == days.getDay()
                ? EdgeInsets.symmetric(vertical: 16.0)
                : EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              day,
              style: TextStyle(
                color: day == days.getDay() ? Colors.black : kTextColor,
                fontWeight:
                    day == days.getDay() ? FontWeight.w900 : FontWeight.normal,
                fontFamily: "Mulish",
              ),
            ),
          ),
        ),
        buildTableCell(time, day, "sabah"),
        //buildTableCell(time, day, "günes"),
        buildTableCell(time, day, "öğle"),
        buildTableCell(time, day, "ikindi"),
        buildTableCell(time, day, "akşam"),
        buildTableCell(time, day, "yatsı"),
      ],
    );
  }

  TableCell buildTableCell(List time, String day, String vakit) {
    return TableCell(
      verticalAlignment: TableCellVerticalAlignment.middle,
      child: Text(
        time[days.getIndexOfDay(gun: day)][vakit],
        style: TextStyle(
          color: day == days.getDay() ? Colors.black : kTextColor,
          fontWeight:
              day == days.getDay() ? FontWeight.bold : FontWeight.normal,
          fontFamily: "Mulish",
        ),
      ),
    );
  }
}
