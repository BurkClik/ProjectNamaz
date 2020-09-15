import 'package:flutter/material.dart';
import 'package:namaz_project_x/components/custom_appbar.dart';
import 'package:namaz_project_x/screens/kaza_sayar/kaza_sayar.dart';
import 'package:namaz_project_x/screens/prayer_time/prayer_time_body.dart';
import 'package:namaz_project_x/theme/size_config.dart';

class PrayerTime extends StatelessWidget {
  static String routeName = "/prayer_time";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Container(
              height: getProportionateScreenHeight(300),
              child: DrawerHeader(
                child: Column(
                  children: [
                    Image(
                      image: AssetImage("assets/images/mosque.png"),
                      height: getProportionateScreenHeight(180),
                    ),
                    Text(
                      'Namaz X',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.watch),
              title: Text('Vakitler'),
              onTap: () {
                Navigator.of(context).popAndPushNamed(KazaSayar.routeName);
              },
            ),
            ListTile(
              leading: Icon(Icons.watch),
              title: Text('Kaza Namazı Sayacı'),
            ),
            ListTile(
              leading: Icon(Icons.watch),
              title: Text('Zikirmatik'),
            ),
          ],
        ),
      ),
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
        ],
      ),
    );
  }
}
