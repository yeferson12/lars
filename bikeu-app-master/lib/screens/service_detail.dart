import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../utils/constants.dart';
import '../widgets/custom_drawer_menu.dart';
import '../widgets/custom_appbar.dart';
import 'package:bikeu/widgets/rating.dart';

class ServiceDetail extends StatelessWidget {

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  Completer<GoogleMapController> _controller = Completer();
  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);
  
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: whiteColor,
        onPressed: (){
          Navigator.of(context).pushNamed("chat");
        },
        child: Icon(Icons.message, size: 30, color: lightGreenColor),
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
              /*
              Positioned(
                top: 60,
                child: ServiceProgressIndicator(step: 3,)
              ),
              */
              CustomAppbar(backActive: true, backFuction: (){ Navigator.of(context).pushNamed("home"); },),
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
          child: Stack(
            children: [
              _mapSection(context),
              Positioned(
                top: size.height*0.50,
                child: _infoSection(context)
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _mapSection(BuildContext context){
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height*0.55,
      width: size.width,
      color: Colors.grey,
      // child: GoogleMap( 
      //   mapType: MapType.hybrid,
      //   initialCameraPosition: _kGooglePlex,
      //   onMapCreated: (GoogleMapController controller) {
      //     _controller.complete(controller);
      //   },
      // ),
    );
  }

  Widget _infoSection(BuildContext context){
    final size = MediaQuery.of(context).size;
    return Container( 
      width: size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(35),
          topRight: Radius.circular(35),
        ),
        color: whiteColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(top:12, right: 12),
            alignment: Alignment.centerRight,
            child: Rating(value: 4, size: 22,),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Row(
              children: [
                Container(
                  child: CircleAvatar(
                    radius: 38,
                    backgroundColor: greenColor,
                    child: CircleAvatar(
                      radius: 35.0,
                      backgroundImage: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTvOFTtJ6v4xGGAPP-pB4YgvSf9mcZvHqX3kg&usqp=CAU'),
                      backgroundColor: Colors.transparent,
                    ),
                  ),
                ),
                SizedBox(width: 10,),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Eduardo Solano", style: textBlack2,),
                      Text("320 Servicios Completados", style: textBlack5,),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10,),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Servicio: ", style: textGreenDark3,),
                    Text("Destino: ", style: textGreenDark3,),
                  ],
                ),
                SizedBox(width: 20,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Pinchaso + Cadena", style: textGreenDark3,),
                    Text("CN 1 # 23", style: textGreenDark3,),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 30,),
          GestureDetector(
            onTap: (){
              Navigator.of(context).pushNamed("help");
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text("¿Necesitas ayuda?", style: textBlack5.copyWith(decoration: TextDecoration.underline, color: lightGreenColor,)),
            ),
          ),
        ],
      ),
    );
  }
}