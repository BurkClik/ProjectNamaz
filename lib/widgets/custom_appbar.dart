import 'dart:async';
import 'package:flutter/material.dart';
import 'package:namaz_project_x/components/appbar/appbar_center_text.dart';
import 'package:namaz_project_x/components/appbar/appbar_info.dart';
import 'package:namaz_project_x/models/times.dart';
import 'package:namaz_project_x/models/weekdays_model.dart';
import 'package:namaz_project_x/services/networking.dart';
import 'package:namaz_project_x/theme/constant.dart';
import 'package:namaz_project_x/theme/size_config.dart';

class CustomAppBar extends StatefulWidget {
  final dynamic date;

  CustomAppBar({this.date});

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
  String aaa;

  @override
  void initState() {
    super.initState();
    print(_now);

/*     print(_now);
    print(newTimes.getSunTime(_now));
    print(newTimes.getTime(_now, "sabah")); */
    _a = Timer.periodic(Duration(seconds: 1), (Timer t) {
      setState(() {
        _now = DateTime.now();
        aaa = weekdays.todayDate(_now);
        var _newTime = DateTime.utc(
          _now.year,
          _now.month,
          23,
          newTimes.hourMinutes(4, "sabah", 0),
          newTimes.hourMinutes(4, "sabah", 1),
        );
        var _diff = _newTime.difference(_now);
        _vakit = _diff.inHours < 10
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
        'ANKARA',
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
                            child: AppbarCenterText(
                              text: "İmsak",
                              fontSize: 28.0,
                            ),
                          ),
                          Container(
                            child: AppbarCenterText(
                              text: '05:23',
                              letterSpacing: 2.0,
                              fontWeight: FontWeight.w800,
                              fontSize: 36.0,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.wb_sunny,
                                color: Colors.yellow,
                              ),
                              Text(
                                newTimes.getSunTime(_now),
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
                              "$aaa",
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
