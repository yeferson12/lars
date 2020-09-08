import 'package:flutter/material.dart';

class CustomDefaultButton extends StatelessWidget {

  CustomDefaultButton({
    this.text,
    this.function,
    this.color,
    this.textStyle,
    this.height,
    this.width,
  });
  
  final String text;
  final Function function;
  final Color color;
  final TextStyle textStyle;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25)
        ),
        color: color,
        onPressed: function,
        child: Text(text, style: textStyle),
      ),
    );
  }
}