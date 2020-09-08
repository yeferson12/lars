import 'package:flutter/material.dart';

import '../utils/constants.dart';

class IconTextButton extends StatelessWidget {

  final String text;
  final Color color;
  final IconData icon;
  final bool iconLeft;
  final double width;
  final double height;
  final Function function;
  final TextStyle textStyle;

  IconTextButton({
    this.text,
    this.color: orangeColor,
    this.icon,
    this.iconLeft,
    this.width,
    this.height,
    this.function,
    this.textStyle: textWhite4,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: RaisedButton(
        color: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
        ),
        onPressed: function,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(text, style: textStyle,),
            SizedBox(width: 5,),
            Icon(icon, color: Colors.white, size: 25,),
          ],
        ),
      ),
    );
  }
}