import 'dart:async';
import 'package:flutter/material.dart';
import 'package:namaz_project_x/models/times.dart';
import 'package:namaz_project_x/theme/size_config.dart';

class CustomAppBar extends StatefulWidget {
  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  Times newTimes = new Times();

  // ignore: unused_field
  Timer _a;
  String _vakit;
  DateTime _now = DateTime.now();

  @override
  void initState() {
    super.initState();
    //var _diff = _newTime.difference(_now);
    print(newTimes.getSunTime(_now));
    print(newTimes.getTime(_now, "sabah"));
    _a = Timer.periodic(Duration(seconds: 1), (Timer t) {
      setState(() {
        _now = DateTime.now();
        var _newTime = DateTime.utc(
          _now.year,
          _now.month,
          18,
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
        style: TextStyle(
          color: Colors.white,
          letterSpacing: 2.0,
          fontWeight: FontWeight.bold,
          shadows: [
            Shadow(
              blurRadius: 10.0,
              color: Colors.black,
              offset: Offset(5.0, 5.0),
            ),
          ],
        ),
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
              "assets/images/anakara.jpg",
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
                            child: Text(
                              "İmsak",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 28.0,
                                shadows: [
                                  Shadow(
                                      blurRadius: 10.0,
                                      color: Colors.black,
                                      offset: Offset(5.0, 5.0)),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            child: Text(
                              "05:23",
                              style: TextStyle(
                                color: Colors.white,
                                letterSpacing: 2.0,
                                fontWeight: FontWeight.w800,
                                fontSize: 36.0,
                                shadows: [
                                  Shadow(
                                      blurRadius: 10.0,
                                      color: Colors.black,
                                      offset: Offset(5.0, 5.0)),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.wb_sunny,
                                  color: Colors.yellow,
                                ),
                                SizedBox(width: getProportionateScreenWidth(4)),
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
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            child: Padding(
                              padding: EdgeInsets.only(bottom: 8.0, left: 8.0),
                              child: Container(
                                  child: Row(
                                children: <Widget>[
                                  Container(
                                    child: Text(
                                      '15 Eylül Çarşamba',
                                      style: TextStyle(
                                          color: Colors.white70,
                                          fontFamily: 'Poppins',
                                          fontSize: 16.0),
                                    ),
                                  ),
                                ],
                              )),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Container(
                                child: Padding(
                                  padding:
                                      EdgeInsets.only(bottom: 8.0, right: 8.0),
                                  child: Text(
                                    "Vaktin Çıkmasına",
                                    style: TextStyle(
                                      color: Colors.white70,
                                      fontSize: 16.0,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                child: Padding(
                                  padding:
                                      EdgeInsets.only(bottom: 8.0, right: 8.0),
                                  child: Text(
                                    _vakit != null ? '$_vakit' : '',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20.0,
                                    ),
                                  ),
                                ),
                              ),
                            ],
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
