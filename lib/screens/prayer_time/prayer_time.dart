import 'package:flutter/material.dart';
import 'package:namaz_project_x/models/times.dart';
import 'package:namaz_project_x/models/weekdays_model.dart';
import 'package:namaz_project_x/services/networking.dart';
import 'package:namaz_project_x/theme/constant.dart';
import 'package:namaz_project_x/theme/size_config.dart';

class DemoScreen extends StatefulWidget {
  static String routeName = "/demo";

  @override
  _DemoScreenState createState() => _DemoScreenState();
}

class _DemoScreenState extends State<DemoScreen> {
  Times times = new Times();
  int currentPage = 0;

  List<String> days = [
    "15 Eylül Çarşamba",
    "16 Eylül Perşembe",
    "17 Eylül Cuma",
    "18 Eylül Cumartesi",
    "19 Eylül Pazar",
    "20 Eylül Pazartesi",
    "21 Eylül Salı",
  ];

  @override
  Widget build(BuildContext context) {
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
