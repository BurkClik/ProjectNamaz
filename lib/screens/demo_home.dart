import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:namaz_project_x/models/times.dart';
import 'package:namaz_project_x/theme/constant.dart';
import 'package:namaz_project_x/screens/prayer_time/prayer_time_body.dart';
import 'package:namaz_project_x/theme/size_config.dart';

class DemoScreen extends StatelessWidget {
  var _now = DateTime.now();
  Times times = new Times();

  static String routeName = "/demo";
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DemoCard(
          vakitName: "İMSAK",
          vakit: times.getAllTimes()[_now.weekday - 1]["sabah"],
          cardImage: AssetImage("assets/images/aksam.jpg"),
        ),
        DemoCard(
          vakitName: "ÖĞLE",
          vakit: times.getAllTimes()[_now.weekday - 1]["öğle"],
          cardImage: AssetImage("assets/images/noon_6.jpg"),
        ),
        DemoCard(
          vakitName: "İKİNDİ",
          vakit: times.getAllTimes()[_now.weekday - 1]["ikindi"],
          cardImage: AssetImage("assets/images/morning.jpg"),
        ),
        DemoCard(
          vakitName: "AKŞAM",
          vakit: times.getAllTimes()[_now.weekday - 1]["akşam"],
          cardImage: AssetImage("assets/images/evening.jpg"),
        ),
        DemoCard(
          vakitName: "YATSI",
          vakit: times.getAllTimes()[_now.weekday - 1]["yatsı"],
          cardImage: AssetImage("assets/images/gece.jpg"),
        ),
      ],
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
