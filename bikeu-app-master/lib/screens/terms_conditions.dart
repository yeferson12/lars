import 'package:flutter/material.dart';

import '../utils/constants.dart';
import '../widgets/custom_appbar.dart';
import '../widgets/custom_drawer_menu.dart';

class TermsConditions extends StatefulWidget {
  @override
  _TermsConditionsState createState() => _TermsConditionsState();
}

class _TermsConditionsState extends State<TermsConditions> {
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
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      height: size.height-60,
      width: size.width,
      child: ListView(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Términos y condiciones",
                  style: titleGreenDarkColor2,
                ),
              ],
            ),
          ),
          SizedBox(height: 15,),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            width: size.width,
            child: Text(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
              style: textGreenDark4,
              textAlign: TextAlign.justify,
            ),
          ),
        ],
      ),
    );
  }
}