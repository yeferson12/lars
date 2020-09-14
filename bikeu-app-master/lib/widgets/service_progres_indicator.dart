import 'package:flutter/material.dart';
import '../utils/constants.dart';

class ServiceProgressIndicator extends StatelessWidget {

  final int step;

  ServiceProgressIndicator({
    this.step
  });
  
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: 30,
      width: size.width,
      color: whiteColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: step >= 1 ? greenColor : greyColor,
            ),
            height: 6,
            width: size.width*0.17,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: step >= 2 ? greenColor : greyColor,
            ),
            height: 6,
            width: size.width*0.17,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: step >= 3 ? greenColor : greyColor,
            ),
            height: 6,
            width: size.width*0.17,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: step >= 4 ? greenColor : greyColor,
            ),
            height: 6,
            width: size.width*0.17,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: step >= 5 ? greenColor : greyColor,
            ),
            height: 6,
            width: size.width*0.17,
          ),
        ],
      )
    );
  }
}