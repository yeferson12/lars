import 'package:flutter/material.dart';

import '../utils/constants.dart';

class DefaultContainer extends StatelessWidget {

  DefaultContainer({
    this.color: whiteColor,
    this.content
  });

  final Widget content;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              blurRadius: 5,
              color: shadowColor,
              offset: Offset(0, 0),
              spreadRadius: 1,
            ),
          ]
        ),
        child: content,
    );
  }
}