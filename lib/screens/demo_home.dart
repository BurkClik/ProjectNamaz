import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:namaz_project_x/constant.dart';
import 'package:namaz_project_x/screens/prayer_time/prayer_time_body.dart';
import 'package:namaz_project_x/size_config.dart';

class DemoHome extends StatefulWidget {
  static String routeName = "/demo_home";
  @override
  _DemoHomeState createState() => _DemoHomeState();
}

class _DemoHomeState extends State<DemoHome> {
  var now = new DateTime.now();
  // now.week day haftanın gününü dönüyor

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
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
            leading: IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                print('Bugünlerin yarınları da var');
              },
            ),
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
                  background: MyFlexiableAppBar(),
                ),
              ],
            ),
          ),
          SliverFixedExtentList(
            itemExtent: 350,
            delegate: SliverChildListDelegate(
              [
                PrayerBody(),
              ],
            ),
          ),
          /* SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Container(
                  height: getProportionateScreenHeight(120),
                  alignment: Alignment.center,
                  color: Colors.orange[100 * (index % 9)],
                  child: Text(
                    'Turuncu $index',
                    style: TextStyle(fontSize: 10),
                  ),
                );
              },
              childCount: 15,
            ),
          ), */
        ],
      ),
    );
  }
}

class MyFlexiableAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
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
                  Padding(
                    padding: EdgeInsets.only(
                      bottom: getProportionateScreenHeight(30),
                    ),
                    child: Container(
                      child: Text(
                        "05:22",
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
                          padding: EdgeInsets.only(bottom: 8.0, right: 8.0),
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
                          padding: EdgeInsets.only(bottom: 8.0, right: 8.0),
                          child: Text(
                            "04:23:12",
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
    );
  }
}
