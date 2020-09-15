import 'package:flutter/material.dart';
import 'package:namaz_project_x/constant.dart';
import 'package:namaz_project_x/screens/prayer_time/prayer_time_body.dart';

class PrayerTime extends StatelessWidget {
  static String routeName = "/prayer_time";
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
                      offset: Offset(5.0, 5.0)),
                ],
              ),
            ),
            actions: [
              IconButton(
                icon: Icon(Icons.location_on),
                onPressed: () {},
              ),
            ],
            iconTheme: IconThemeData(color: Colors.white),
            centerTitle: true,
            expandedHeight: 250.0,
            floating: false,
            pinned: true,
            snap: false,
            flexibleSpace: Stack(
              children: [
                Positioned.fill(
                  child: Image.asset(
                    "assets/images/anakara.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
                FlexibleSpaceBar(
                  centerTitle: true,
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('data'),
                      Text('data'),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SliverFixedExtentList(
            itemExtent: 100,
            delegate: SliverChildListDelegate(
              [
                Card(
                  color: Colors.white,
                  elevation: 6,
                  shadowColor: kPrimaryColor,
                  margin: EdgeInsets.all(10.0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: BorderSide(color: kPrimaryColor, width: 2.0)),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text('data'),
                          Text('data'),
                          Text('data'),
                          Text('data'),
                          Text('data')
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text('Pazartesi'),
                          Text('data'),
                          Text('data'),
                          Text('data'),
                          Text('data'),
                          Text('data'),
                        ],
                      ),
                      Row(),
                      Row(),
                      Row(),
                      Row(),
                    ],
                  ),
                ),
              ],
            ),
          ),
          /* SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Container(
                  height: 100,
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
