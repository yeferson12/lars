import 'package:bikeu/widgets/default_container.dart';
import 'package:bikeu/widgets/rating.dart';
import 'package:flutter/material.dart';

import '../utils/constants.dart';
import '../widgets/custom_appbar.dart';
import '../widgets/custom_drawer_menu.dart';
import '../widgets/collapse_item.dart';

class Chat extends StatefulWidget {
  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {

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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _headerSection(),
          _inpuntSection(context),
        ]
      )
    );
  }

  Widget _headerSection(){
    return DefaultContainer(
      content: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundColor: greenColor,
            radius: 30,
            child: CircleAvatar(
              radius: 29,
              backgroundImage: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSMFS8axeLfkZEHmwiwACr2g903NIxXHG-Dcg&usqp=CAU"),
            ),
          ),
          SizedBox(width: 10,),
          Column( 
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Eduardo Solano", style: titleGreenDarkColor2,),
              Text("Bicimensajero - Bicimecanico", style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),),
              Text("Bicimensajeros de bogota", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
              SizedBox(height: 10,),
            ],
          ),
        ],
      ),
    ); 
  }

  Widget _inpuntSection(BuildContext context){
    final size = MediaQuery.of(context).size;
    return DefaultContainer(
      content: Column(
        children: [
          Container(
            height: size.height*0.6,
          ),
          Container(
            child: Row(
              children: [
                Expanded(
                  flex: 5,
                  child: TextFormField(
                    style: textGreenDark4,
                    decoration: InputDecoration(
                      labelStyle: textBlack4.copyWith(color: greenDarkColor),
                      labelText: "Escribe tu mensaje",
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: IconButton(
                    onPressed: (){},
                    icon: Icon(Icons.send),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}