import 'package:flutter/material.dart';
import 'package:namaz_project_x/models/weekdays_model.dart';
import 'package:namaz_project_x/services/networking.dart';
import 'package:namaz_project_x/widgets/custom_appbar.dart';
import 'package:namaz_project_x/screens/prayer_time/prayer_time.dart';

class Home extends StatefulWidget {
  static String routeName = "/home";

  Home({this.cityName, this.districkName});
  final cityName, districkName;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future<dynamic> getJson() async {
    NetworkHelper networkHelper = NetworkHelper("http://10.0.2.2:5000/times");
    var data = await networkHelper.getData();
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          CustomAppBar(
            date: getJson(),
            cityName: widget.cityName,
            districtName: widget.districkName,
          ),
          SliverFixedExtentList(
            itemExtent: 670,
            delegate: SliverChildListDelegate(
              [
                PrayerTimeScreen(data: getJson()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
