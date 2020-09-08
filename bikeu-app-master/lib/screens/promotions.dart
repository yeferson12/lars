import 'package:bikeu/utils/constants.dart';
import 'package:flutter/material.dart';

import 'package:bikeu/widgets/custom_appbar.dart';
import '../widgets/custom_drawer_menu.dart';

class Promotions extends StatelessWidget {
  
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: CustomDrawerMenu(),
      body: SafeArea(
        child: Container(
          height: double.infinity,
          child: Stack(
            children: [
              Positioned(
                top: 60,
                child: _buildContent(context),
              ),
              CustomAppbar(backActive: false, backFuction: (){}, scaffoldKey: _scaffoldKey,),
            ],
          ),
        ), 
      ),
    );
  }

  Widget _buildContent(BuildContext context){
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height-60,
      width: size.width,
      child: Center(
        child: Text("Muy pronto...", style: titleGreen1.copyWith(color: Color.fromRGBO(0, 181, 241, 1))),
      ),
    );
  }
}