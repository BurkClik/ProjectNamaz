import 'dart:async';
import 'package:flutter/material.dart';
import 'package:namaz_project_x/components/appbar/appbar_center_text.dart';
import 'package:namaz_project_x/components/appbar/appbar_info.dart';
import 'package:namaz_project_x/models/times.dart';
import 'package:namaz_project_x/models/weekdays_model.dart';
import 'package:namaz_project_x/theme/constant.dart';

class CustomAppBar extends StatefulWidget {
  CustomAppBar({this.date, this.cityName, this.districtName});

  final date, cityName, districtName;

  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  Times newTimes = new Times();
  Weekdays weekdays = Weekdays();

  // ignore: unused_field
  Timer _a;
  String _vakit;
  DateTime _now = DateTime.now();
  String dateToday;

/*   List<String> demoV = ["imsak", "öğle", "ikindi", "akşam", "yatsı"];
  List<String> demoS = ["05:00", "13:02", "16:42", "18:32", "20:12"]; */

  String demo;

  Future<Map<String, dynamic>> getData(DateTime today) async {
    var data = await widget.date;
    return data[today.day - 1];
  }

  void handleData() async {
    await getData(_now).then((value) async {
      demo = value["ikindi"];
    });
  }

  @override
  void initState() {
    //print(getData(_now.add(Duration(days: 1))).then((value) => print(value)));
    super.initState();
    handleData();
    print('demo: $demo');
    // Vakit ile ilgili kısımlar
    _a = Timer.periodic(Duration(seconds: 1), (Timer t) {
      setState(() {
        _now = DateTime.now();
        dateToday =
            weekdays.todayDate(_now); // Date at left bottom 29 Eylül Salı
        var _newTime = DateTime.utc(
          _now.year,
          _now.month,
          _now.day,
          newTimes.hourMinutes(
              4, "sabah", 0), // (Ayın kaçıncı günü, vakit ismi, saat-dakika)
          newTimes.hourMinutes(4, "sabah", 1),
        );
        var _diff = _newTime.difference(_now);
        _vakit = _diff.inHours < 10 // Vaktin çıkması
            ? "0${_diff.toString().split('.')[0]}"
            : "${_diff.toString().split('.')[0]}";
      });
    });
  }

  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title: Text(
        widget.districtName,
        style: kAppBarCity,
      ),
      centerTitle: true,
      actions: [
        IconButton(
          icon: Icon(Icons.location_on),
          onPressed: () {
            print("Herkese Salam");
          },
        ),
      ],
      iconTheme: IconThemeData(color: Colors.white),
      pinned: true,
      floating: true,
      snap: false,
      expandedHeight: 240.0,
      flexibleSpace: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              "assets/images/cami2.jpg",
              fit: BoxFit.cover,
              colorBlendMode: BlendMode.softLight,
              color: Colors.black45,
            ),
          ),
          FlexibleSpaceBar(
            background: Container(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            child: FutureBuilder(
                              future: getData(_now),
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  return AppbarCenterText(
                                    text: snapshot.data.keys
                                        .toList()[0]
                                        .toUpperCase(),
                                    fontSize: 28.0,
                                  );
                                }
                                return Text("aaaa");
                              },
                            ),
                          ),
                          Container(
                            child: FutureBuilder(
                              future: getData(_now),
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  return AppbarCenterText(
                                    text: '${snapshot.data["imsak"]}',
                                    letterSpacing: 2.0,
                                    fontWeight: FontWeight.w800,
                                    fontSize: 36.0,
                                  );
                                }
                                return Text(
                                  "aaaa",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ); // Burası düzenlenecek
                              },
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.wb_sunny,
                                color: Colors.yellow,
                              ),
                              FutureBuilder(
                                future: getData(_now),
                                builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                                    return Text(
                                      snapshot.data["güneş"],
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        shadows: [
                                          Shadow(
                                              blurRadius: 10.0,
                                              color: Colors.black,
                                              offset: Offset(5.0, 5.0)),
                                        ],
                                      ),
                                    );
                                  }
                                  return Text("aaaa"); // düzenlenecek
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(bottom: 8.0, left: 8.0),
                            child: Text(
                              "$dateToday",
                              style: kAppbarInfoText,
                            ),
                          ),
                          AppbarInfo(
                            crossAlign: CrossAxisAlignment.end,
                            infoText: "Vaktin Çıkmasına",
                            timeText: _vakit != null ? "$_vakit" : "",
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
