import 'package:bikeu/utils/constants.dart';
import 'package:flutter/material.dart';

class Rating extends StatelessWidget {

  final double value;
  final double size;

  Rating({
    this.value,
    this.size = 25
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Icon(Icons.star, color: value >=1 ? yellowColor : greyColor, size: size,),
          Icon(Icons.star, color: value >=2 ? yellowColor : greyColor, size: size,),
          Icon(Icons.star, color: value >=3 ? yellowColor : greyColor, size: size,),
          Icon(Icons.star, color: value >=4 ? yellowColor : greyColor, size: size,),
          Icon(Icons.star, color: value >=5 ? yellowColor : greyColor, size: size,),
        ],
      ),
    );
  }
}