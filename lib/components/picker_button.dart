import 'package:flutter/material.dart';
import 'package:namaz_project_x/theme/constant.dart';
import 'package:namaz_project_x/theme/size_config.dart';

class PickerButton extends StatefulWidget {
  final Text buttonText;
  final Function buttonPressed;

  const PickerButton({Key key, this.buttonText, this.buttonPressed}) : super(key: key);

  @override
  _PickerButtonState createState() => _PickerButtonState();
}

class _PickerButtonState extends State<PickerButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: getProportionateScreenWidth(200),
      height: getProportionateScreenHeight(50),
      child: RaisedButton.icon(
        onPressed: widget.buttonPressed,
        icon: Icon(Icons.arrow_downward),
        label: widget.buttonText,
        elevation: 8.0,
        color: Colors.white,
        disabledColor: kSecondaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
          side: BorderSide(color: kPrimaryColor, width: 2.0),
        ),
      ),
    );
  }
}
