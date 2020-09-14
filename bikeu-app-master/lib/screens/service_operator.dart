import 'package:flutter/material.dart';

import '../utils/constants.dart';
import 'package:bikeu/widgets/rating.dart';
import '../widgets/custom_drawer_menu.dart';
import '../widgets/custom_appbar.dart';
import '../widgets/icon_text_button.dart';

class ServiceOperator extends StatelessWidget {
  
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: IconTextButton(
        text: "Finalizar",
        width: size.width*0.4,
        height: 40,
        icon: Icons.arrow_forward,
        function: (){ Navigator.of(context).pushNamed("service-detail"); },
      ),
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
              CustomAppbar(backActive: false, backFuction: (){ Navigator.of(context).pop(); },),
            ],
          ),
        ), 
      ),
    );
  }

  Widget _buildContent(BuildContext context){
    final size = MediaQuery.of(context).size;
    return Container(
      color: whiteColor,
      height: size.height-60, 
      width: size.width,
      child: SingleChildScrollView(
        child: Container(
          height: size.height-130, 
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Tu bicimensajero".toUpperCase(), style: titleGreenDarkColor2,),
              Text("En camino", style: textGreenDark3,),
              _operatorImage(),
              _operatorInfo(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _operatorImage(){
    return Container(
      padding: EdgeInsets.all(10),
      child: Stack(
        children: [
          CircleAvatar(
            radius: 130,
            backgroundColor: greenColor,
            child: CircleAvatar(
              radius: 120.0,
              backgroundImage: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTvOFTtJ6v4xGGAPP-pB4YgvSf9mcZvHqX3kg&usqp=CAU'),
              backgroundColor: Colors.transparent,
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: CircleAvatar(
              radius: 50,
              backgroundColor: greenColor,
              child: CircleAvatar(
                radius: 46.0,
                backgroundImage: NetworkImage('https://png.pngtree.com/element_our/png_detail/20180823/bike-logo-design-template-vector-png_62379.jpg'),
                backgroundColor: Colors.transparent,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _operatorInfo(){
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15),
      child: Column(
        children: [
          Text("Eduardo Solano", style: textGreenDark3,),
          Rating(value: 4, size: 30,),
          Text("320 Servicios Completados", style: textGreenDark5,),
        ],
      ),
    );
  }
}