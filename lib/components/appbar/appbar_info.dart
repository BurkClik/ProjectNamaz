import 'package:flutter/material.dart';
import 'package:namaz_project_x/components/appbar/appbar_info_text.dart';
import 'package:namaz_project_x/theme/constant.dart';

class AppbarInfo extends StatelessWidget {
  final CrossAxisAlignment crossAlign;
  final String infoText;
  final String timeText;
  const AppbarInfo({Key key, this.crossAlign, this.infoText, this.timeText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: crossAlign,
      children: [
        AppbarInfoText(
          text: infoText,
          padding: EdgeInsets.only(right: 8.0),
          style: kAppbarInfoText,
        ),
        AppbarInfoText(
          text: timeText,
          padding: EdgeInsets.only(bottom: 8.0, right: 8.0),
          style: kAppbarTimeText,
        )
      ],
    );
  }
}
