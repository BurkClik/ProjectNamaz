import 'package:flutter/material.dart';
import 'package:namaz_project_x/theme/size_config.dart';

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
