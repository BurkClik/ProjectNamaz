import 'package:flutter/material.dart';

class AppbarInfoText extends StatelessWidget {
  final String text;
  final EdgeInsetsGeometry padding;
  final TextStyle style;

  const AppbarInfoText({Key key, this.text, this.padding, this.style})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: padding,
        child: Text(
          text,
          style: style,
        ),
      ),
    );
  }
}
