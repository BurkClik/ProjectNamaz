import 'package:flutter/material.dart';
import 'package:namaz_project_x/models/weekdays_model.dart';
import 'package:namaz_project_x/services/networking.dart';
import 'package:namaz_project_x/widgets/custom_appbar.dart';
import 'package:namaz_project_x/screens/prayer_time/prayer_time.dart';

class Home extends StatefulWidget {
  static String routeName = "/home";

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var data;
  void getJson() async {
    NetworkHelper networkHelper = NetworkHelper("http://10.0.2.2:5000/times");
    data = await networkHelper.getData();
    print(data);
  }

  @override
  Widget build(BuildContext context) {
    //getJson();
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          CustomAppBar(date: data),
          SliverFixedExtentList(
            itemExtent: 670,
            delegate: SliverChildListDelegate(
              [
                DemoScreen(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
