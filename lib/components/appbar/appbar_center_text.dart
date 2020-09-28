import 'package:flutter/material.dart';

class AppbarCenterText extends StatelessWidget {
  final double letterSpacing;
  final double fontSize;
  final String text;
  final FontWeight fontWeight;

  const AppbarCenterText(
      {Key key,
      this.letterSpacing,
      this.fontSize,
      @required this.text,
      this.fontWeight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: Colors.white,
        fontSize: fontSize,
        letterSpacing: letterSpacing,
        fontWeight: fontWeight,
        shadows: [
          Shadow(
            blurRadius: 10.0,
            color: Colors.black,
            offset: Offset(5.0, 5.0),
          ),
        ],
      ),
    );
  }
}
