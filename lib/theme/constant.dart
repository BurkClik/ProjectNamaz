import 'package:flutter/material.dart';

const kPrimaryColor = Color(0xFFFF7643);
const kPrimaryLightColor = Color(0xFFFFECDF);/*
const kPrimaryGradientColor = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFFFFA53E), Color(0xFFFF7643)]);*/
const kSecondaryColor = Color(0xFF979797);
const kTextColor = Color(0xFF757575);

const kAnimationDuration = Duration(milliseconds: 200);

// Vakit Isimleri TextStyle
const kVakitTextStyle = TextStyle(
  fontFamily: "Mulish",
);

// Custom appBar
const kAppBarCity = TextStyle(
  color: Colors.white,
  letterSpacing: 2.0,
  fontWeight: FontWeight.bold,
  shadows: [
    Shadow(
      blurRadius: 10.0,
      color: Colors.black,
      offset: Offset(5.0, 5.0),
    ),
  ],
);

const kAppbarInfoText = TextStyle(
  color: Colors.white70,
  fontSize: 16.0,
);

const kAppbarTimeText = TextStyle(
  color: Colors.white,
  fontSize: 20.0,
);
