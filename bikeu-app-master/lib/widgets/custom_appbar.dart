import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget {

  final bool backActive;
  final Function backFuction;
  final GlobalKey<ScaffoldState> scaffoldKey;

  CustomAppbar({
    this.backActive=false,
    this.backFuction,
    this.scaffoldKey,
  });


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      color: Colors.white,
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              IconButton(
                onPressed: (){
                  if(scaffoldKey.currentState.isDrawerOpen){
                    scaffoldKey.currentState.openEndDrawer();
                  }else{
                    scaffoldKey.currentState.openDrawer();
                  }
                },
                icon: Icon(Icons.menu, size: 28),
              ),
              SizedBox(width: 5,),
              if(backActive)
                IconButton(
                  onPressed: backFuction,
                  icon: Icon(Icons.arrow_back, size: 28),
                ),
            ],
          ),
          Container(
            padding: EdgeInsets.all(5),
            child: Image(
              image: AssetImage("assets/img/png/logo-3.png"),
            ),
          ),
        ],
      ),
    );
  }
}