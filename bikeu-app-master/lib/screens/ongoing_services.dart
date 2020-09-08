import 'package:flutter/material.dart';

import '../utils/constants.dart';
import '../widgets/custom_appbar.dart';
import '../widgets/custom_drawer_menu.dart';

class OngoingServices extends StatelessWidget {
  
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
          Text("Servicios en curso", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
          Text("Se listan todos los servicios que tienes activos", style: TextStyle(fontSize: 15, color: Colors.grey)),
          Divider(),
          _listItem(),
          _listItem(),
          _listItem(),
        ],
      ),
    );
  }

  Widget _listItem(){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            blurRadius: 6,
            color: shadowColor,
            offset: Offset(0, 0),
            spreadRadius: 1,
          ),
        ]
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Bicimecanica"),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text("Origen:", style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),),
                      SizedBox(width: 3,),
                      Text("Portal de las Americas, Bogota.", style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal),),
                    ],
                  ),
                  Row(
                    children: [
                      Text("Destino:", style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),),
                      SizedBox(width: 3,),
                      Text("CC, Tunal, Bogota", style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal),),
                    ],
                  ),
                  Row(
                    children: [
                      Text("Peso:", style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),),
                      SizedBox(width: 3,),
                      Text("3 km", style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal),),
                    ],
                  ),
                  Row(
                    children: [
                      Text("Volumen:", style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),),
                      SizedBox(width: 5,),
                      Text("35 cm", style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal),),
                    ],
                  ),
                ],
              ),
              Image(
                image: AssetImage("assets/img/png/icon-messaging.png"),
              ),
            ],
          ),
          Text("Empresa BikeU elegida es:", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
          _companySection(),
          Text("Tus observaciones:", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
          Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.", style: TextStyle(fontSize: 13, fontWeight: FontWeight.normal),),
          FlatButton(
            onPressed: (){},
            child: Text("¿Deseas cancelar este servicio?", style: TextStyle(color: Colors.red),),
          ),
        ],
      ),
    );
  }

  Widget _companySection(){
    return Container(
      padding: EdgeInsets.symmetric(vertical: 7, horizontal: 7),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: greybackgroundColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            radius: 30,
            child: Image(
              image: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQ2WKSiNiJ73sVlOqvJxDfUZTXqwuwbK3oT5Q&usqp=CAU"),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(Icons.star, color: Colors.yellow, size: 20,),
                  Icon(Icons.star, color: Colors.yellow, size: 20,),
                  Icon(Icons.star, color: Colors.yellow, size: 20,),
                  Icon(Icons.star, color: Colors.yellow, size: 20,),
                  Icon(Icons.star, size: 20),
                ],
              ), 
              Text("Mensajeros en Bici Bogota", style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal)),
              Text("12.000"),
              Text("A 2 KILOMETROS DE TU UBICACION", style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal)),
            ],
          )
        ],
      ),
    );
  }
}