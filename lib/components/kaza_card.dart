import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:namaz_project_x/theme/size_config.dart';

class KazaCard extends StatefulWidget {
  final String namazIsmi;

  const KazaCard({Key key, @required this.namazIsmi}) : super(key: key);
  @override
  _KazaCardState createState() => _KazaCardState();
}

class _KazaCardState extends State<KazaCard> {
  int _firstValue = 0;
  int _kalanKaza = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 18.0),
      child: Container(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        height: getProportionateScreenHeight(80),
        child: Card(
          shadowColor: Colors.black,
          elevation: 10,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: Icon(
                  FontAwesome.minus,
                  size: 34.0,
                ),
                onPressed: () {
                  setState(() {
                    if (_firstValue > 0) {
                      _firstValue--;
                      _kalanKaza++;
                    }
                  });
                },
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    _kalanKaza == 0
                        ? widget.namazIsmi
                        : '${widget.namazIsmi}($_kalanKaza)',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    '$_firstValue',
                    style: TextStyle(fontSize: 32),
                  ),
                ],
              ),
              IconButton(
                icon: Icon(
                  FontAwesome.plus,
                  size: 34.0,
                ),
                onPressed: () {
                  setState(() {
                    _firstValue++;
                    if (_kalanKaza != 0) {
                      _kalanKaza--;
                    }
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
