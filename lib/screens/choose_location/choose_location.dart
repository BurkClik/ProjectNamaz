import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:namaz_project_x/screens/choose_location/choose_location_body.dart';

class ChooseLocation extends StatelessWidget {
  static String routeName = "/choose_location";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Lütfen Şehir Seçiniz',
          style: GoogleFonts.muli(),
        ),
        centerTitle: true,
      ),
      body: ChooseLocationBody(),
    );
  }
}
