import 'package:flutter/material.dart';
import 'package:namaz_project_x/components/custom_appbar.dart';
import 'package:namaz_project_x/screens/kaza_calculate/kaza.calculate.dart';
import 'package:namaz_project_x/screens/kaza_sayar/kaza_sayar.dart';
import 'package:namaz_project_x/screens/prayer_time/prayer_time_body.dart';
import 'package:namaz_project_x/screens/zikir/zikir.dart';
import 'package:namaz_project_x/theme/size_config.dart';

class PrayerTime extends StatefulWidget {
  static String routeName = "/prayer_time";

  @override
  _PrayerTimeState createState() => _PrayerTimeState();
}

class _PrayerTimeState extends State<PrayerTime> {
  int _selectedPage = 0;

  final List<Widget> screens = [
    PrayerBody(),
    KazaSayar(),
    KazaCalculate(),
    Zikir(),
  ];

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
                setState(() {
                  _selectedPage = 0;
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.watch),
              title: Text('Kaza Namazı Sayacı'),
              onTap: () {
                setState(() {
                  _selectedPage = 1;
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.watch),
              title: Text('Kaza Namazı Hesaplayacı'),
              onTap: () {
                setState(() {
                  _selectedPage = 2;
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.watch),
              title: Text('Zikirmatik'),
              onTap: () {
                setState(() {
                  _selectedPage = 3;
                });
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: CustomScrollView(
        slivers: [
          CustomAppBar(),
          SliverFixedExtentList(
            itemExtent: 800,
            delegate: SliverChildListDelegate(
              [
                screens[_selectedPage],
              ],
            ),
          ),
        ],
      ),
    );
  }
}
