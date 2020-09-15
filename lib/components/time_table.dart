import 'package:flutter/material.dart';
import 'package:namaz_project_x/theme/constant.dart';
import 'package:namaz_project_x/models/weekdays_model.dart';

class TimeTable extends StatefulWidget {
  @override
  _TimeTableState createState() => _TimeTableState();
}

class _TimeTableState extends State<TimeTable> {
  Weekdays days = new Weekdays();

  List<Map<String, String>> data = [
    {
      "sabah": "05:22",
      "günes": "06:40",
      "öğle": "13:22",
      "ikindi": "16:44",
      "akşam": "18.58",
      "yatsı": "20:37"
    },
    {
      "sabah": "05:23",
      "günes": "06:41",
      "öğle": "13:23",
      "ikindi": "16:45",
      "akşam": "18.59",
      "yatsı": "20:38"
    },
    {
      "sabah": "05:24",
      "günes": "06:42",
      "öğle": "13:24",
      "ikindi": "16:46",
      "akşam": "19.00",
      "yatsı": "20:39"
    },
    {
      "sabah": "05:25",
      "günes": "06:43",
      "öğle": "13:25",
      "ikindi": "16:47",
      "akşam": "19.01",
      "yatsı": "20:40"
    },
    {
      "sabah": "05:26",
      "günes": "06:44",
      "öğle": "13:26",
      "ikindi": "16:48",
      "akşam": "19.02",
      "yatsı": "20:41"
    },
    {
      "sabah": "05:27",
      "günes": "06:45",
      "öğle": "13:27",
      "ikindi": "16:49",
      "akşam": "19.03",
      "yatsı": "20:42"
    },
    {
      "sabah": "05:28",
      "günes": "06:46",
      "öğle": "13:28",
      "ikindi": "16:52",
      "akşam": "19.04",
      "yatsı": "20:43"
    },
  ];

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
              Text('Güneş', style: kVakitTextStyle),
              Text('Öğle', style: kVakitTextStyle),
              Text('İkindi', style: kVakitTextStyle),
              Text('Akşam', style: kVakitTextStyle),
              Text('Yatsı', style: kVakitTextStyle),
            ],
          ),
          buildTableRow(days.getWeekdays()[0], data),
          buildTableRow(days.getWeekdays()[1], data),
          buildTableRow(days.getWeekdays()[2], data),
          buildTableRow(days.getWeekdays()[3], data),
          buildTableRow(days.getWeekdays()[4], data),
          buildTableRow(days.getWeekdays()[5], data),
          buildTableRow(days.getWeekdays()[6], data),
        ],
      ),
    );
  }

  TableRow buildTableRow(String day, List time) {
    return TableRow(
      children: [
        TableCell(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 8.0),
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
        buildTableCell(time, day, "günes"),
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
              day == days.getDay() ? FontWeight.w900 : FontWeight.normal,
          fontFamily: "Mulish",
        ),
      ),
    );
  }
}
