class Weekdays {
  List<String> _days = <String>[
    "Pazartesi",
    "Salı",
    "Çarşamba",
    "Perşembe",
    "Cuma",
    "Cumartesi",
    "Pazar",
  ];

  String getDay() {
    return _days[DateTime.now().weekday - 1];
  }

  List getWeekdays() {
    return _days;
  }

  int getIndexOfDay({String gun}) {
    return _days.indexOf(gun);
  }
}
