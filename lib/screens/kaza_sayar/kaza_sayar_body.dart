import 'package:flutter/material.dart';
import 'package:namaz_project_x/components/kaza_card.dart';

class KazaSayarBody extends StatefulWidget {
  @override
  _KazaSayarBodyState createState() => _KazaSayarBodyState();
}

class _KazaSayarBodyState extends State<KazaSayarBody> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 38.0),
      child: Column(
        children: [
          KazaCard(namazIsmi: "SABAH"),
          KazaCard(namazIsmi: "ÖĞLE"),
          KazaCard(namazIsmi: "İKİNDİ"),
          KazaCard(namazIsmi: "AKŞAM"),
          KazaCard(namazIsmi: "YATSI"),
          KazaCard(namazIsmi: "VİTR"),
        ],
      ),
    );
  }
}
