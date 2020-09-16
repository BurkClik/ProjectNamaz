class Times {
  List<Map<String, String>> _data = [
    {
      "sabah": "05:22",
      "günes": "06:40",
      "öğle": "13:22",
      "ikindi": "16:44",
      "akşam": "18:58",
      "yatsı": "20:37"
    },
    {
      "sabah": "05:23",
      "günes": "06:41",
      "öğle": "13:23",
      "ikindi": "16:45",
      "akşam": "18:59",
      "yatsı": "20:38"
    },
    {
      "sabah": "05:24",
      "günes": "06:42",
      "öğle": "13:24",
      "ikindi": "16:46",
      "akşam": "19:00",
      "yatsı": "20:39"
    },
    {
      "sabah": "05:25",
      "günes": "06:43",
      "öğle": "13:25",
      "ikindi": "16:47",
      "akşam": "19:01",
      "yatsı": "20:40"
    },
    {
      "sabah": "05:26",
      "günes": "06:44",
      "öğle": "13:26",
      "ikindi": "16:48",
      "akşam": "19:02",
      "yatsı": "20:41"
    },
    {
      "sabah": "05:27",
      "günes": "06:45",
      "öğle": "13:27",
      "ikindi": "16:49",
      "akşam": "19:03",
      "yatsı": "20:42"
    },
    {
      "sabah": "05:28",
      "günes": "06:46",
      "öğle": "13:28",
      "ikindi": "16:52",
      "akşam": "19:04",
      "yatsı": "20:43"
    },
  ];

  List getTimes() {
    return _data;
  }

  int hourMinutes(int day, String time, int hm) {
    if (hm == 0) {
      return int.parse(_data[day][time].split(':')[hm]) - 3;
    }
    return int.parse(_data[day][time].split(':')[hm]);
  }

  String getSunTime(DateTime today) {
    return _data[today.weekday]["günes"];
  }
}
