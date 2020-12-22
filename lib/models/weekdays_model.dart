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

  List<String> _month = <String>[
    "Ocak",
    "Şubat",
    "Mart",
    "Nisan",
    "Mayıs",
    "Haziran",
    "Temmuz",
    "Ağustos",
    "Eylül",
    "Ekim",
    "Kasım",
    "Aralık"
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

  String todayDate(DateTime now) {
    if (now.day < 10) {
      return "0${now.day} ${_month[now.month - 1]} ${_days[now.weekday - 1]}";
    }
    return "${now.day} ${_month[now.month - 1]} ${_days[now.weekday - 1]}";
  }
}
