import 'package:flutter/material.dart';

class PrayerBody extends StatefulWidget {
  @override
  _PrayerBodyState createState() => _PrayerBodyState();
}

class _PrayerBodyState extends State<PrayerBody> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Colors.orange,
        ),
        Container(
          color: Colors.white,
        )
      ],
    );
  }
}
