import 'dart:async';
import 'package:flutter/material.dart';
import 'package:namaz_project_x/models/times.dart';
import 'package:namaz_project_x/models/weekdays_model.dart';
import 'package:namaz_project_x/theme/constant.dart';
import 'package:namaz_project_x/theme/size_config.dart';

class PrayerTimeScreen extends StatefulWidget {
  static String routeName = "/prayer_time";

  PrayerTimeScreen({this.data});

  final dynamic data;

  @override
  _PrayerTimeState createState() => _PrayerTimeState();
}

class _PrayerTimeState extends State<PrayerTimeScreen> {
  Times times = new Times();
  Weekdays weekdays = new Weekdays();
  int currentPage = 0;

  Timer _a;
  DateTime _now = DateTime.now();
  String dateToday;

  Future<Map<String, dynamic>> getData(DateTime today) async {
    var data = await widget.data;
    return data[weekdays.todayDate(today)];
  }

  @override
  void initState() {
    super.initState();

    // Vakit ile ilgili kısımlar
    _a = Timer.periodic(Duration(seconds: 1), (Timer t) {
      setState(() {
        _now = DateTime.now();

        dateToday =
            weekdays.todayDate(_now); // Date at left bottom 29 Eylül Salı
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
    List<String> days = [
      weekdays.todayDate(_now),
      weekdays.todayDate(_now.add(Duration(days: 1))),
      weekdays.todayDate(_now.add(Duration(days: 2))),
      weekdays.todayDate(_now.add(Duration(days: 3))),
      weekdays.todayDate(_now.add(Duration(days: 4))),
      weekdays.todayDate(_now.add(Duration(days: 5))),
      weekdays.todayDate(_now.add(Duration(days: 6))),
    ];
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 20.0),
          child: Text(
            days[currentPage],
            style: TextStyle(color: kPrimaryColor, fontWeight: FontWeight.w700),
          ),
        ),
        Expanded(
          child: PageView.builder(
            onPageChanged: (value) {
              setState(() {
                currentPage = value;
              });
            },
            itemCount: 7,
            itemBuilder: (context, index) =>
                VakitList(times: times.getAllTimes()[index]),
          ),
        ),
      ],
    );
  }
}

class VakitList extends StatelessWidget {
  final Map times;

  const VakitList({Key key, this.times}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 18.0),
      child: Column(
        children: [
          DemoCard(
            vakitName: "İMSAK",
            vakit: times["sabah"],
            cardImage: AssetImage("assets/images/sabah.jpg"),
          ),
          DemoCard(
            vakitName: "ÖĞLE",
            vakit: times["öğle"],
            cardImage: AssetImage("assets/images/ogle.jpg"),
          ),
          DemoCard(
            vakitName: "İKİNDİ",
            vakit: times["ikindi"],
            cardImage: AssetImage("assets/images/ikindi.jpg"),
          ),
          DemoCard(
            vakitName: "AKŞAM",
            vakit: times["akşam"],
            cardImage: AssetImage("assets/images/aksam.jpg"),
          ),
          DemoCard(
            vakitName: "YATSI",
            vakit: times["yatsı"],
            cardImage: AssetImage("assets/images/gece.jpg"),
          ),
        ],
      ),
    );
  }
}

class DemoCard extends StatelessWidget {
  final String vakitName, vakit;
  final ImageProvider cardImage;

  const DemoCard({Key key, this.vakit, this.vakitName, this.cardImage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: getProportionateScreenHeight(18),
        left: getProportionateScreenWidth(18),
        right: getProportionateScreenWidth(18),
      ),
      child: Container(
        height: getProportionateScreenHeight(100),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: cardImage,
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(18.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              vakitName,
              style: TextStyle(
                fontSize: 30,
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontFamily: "Mulish",
                shadows: [
                  Shadow(
                      blurRadius: 2.0,
                      color: Colors.black,
                      offset: Offset(2.0, 2.0)),
                ],
              ),
            ),
            Text(
              vakit,
              style: TextStyle(
                fontSize: 30,
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontFamily: "Mulish",
                shadows: [
                  Shadow(
                      blurRadius: 5.0,
                      color: Colors.black,
                      offset: Offset(2.0, 2.0)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
