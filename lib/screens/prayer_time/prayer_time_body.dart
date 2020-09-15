import 'package:flutter/material.dart';
import 'package:namaz_project_x/components/time_table.dart';

class PrayerBody extends StatefulWidget {
  @override
  _PrayerBodyState createState() => _PrayerBodyState();
}

class _PrayerBodyState extends State<PrayerBody> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        TimeTable(),
      ],
    );
  }
}
