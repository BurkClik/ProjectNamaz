class Vakit {
  final String il;
  final String ilce;
  final List<Map<String, Map<String, String>>> vakit;

  const Vakit({this.il, this.ilce, this.vakit});

  factory Vakit.fromJson(Map<String, dynamic> json) {
    if (json == null) {
      return null;
    }
    return Vakit(il: json["il"], ilce: json["ilce"], vakit: json["vakit"]);
  }
}

final vakitler = [
  new Vakit(il: "Ankara", ilce: "Etlik", vakit: [
    {
      "09.10.2020": {
        "imsak": "06:20",
      }
    }
  ])
]; //localhost:8000/il=?ankara?ilce=etlik


class Time {
  final List<Map<String, dynamic>> times;

  Time({this.times});

  factory Time.fromJson(Map<String, dynamic> json) {
    if (json == null) {
      return null;
    }
    return Time(times: json[0]);
  }
}

final times = [
  new Time(
    times: [
      {
        "imsak":"05:47",
        "güneş":"07:07"
      }
    ]
  )
];
