import 'package:flutter/material.dart';

import '../utils/constants.dart';
import '../widgets/custom_appbar.dart';
import '../widgets/custom_drawer_menu.dart';
import '../widgets/default_container.dart';

class ProvidedServices extends StatefulWidget {
  @override
  _ProvidedServicesState createState() => _ProvidedServicesState();
}

class _ProvidedServicesState extends State<ProvidedServices> {

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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Servicios prestados", style: titleGreenDarkColor2,),
                Text("05", style: titleBlack2,)
              ],
            ),
          ),
          _itemSection("Finalizado", "Portal de las Americas, Bogota", "CC Tunal, Bogota", "05/09/2020 - 15:45", 25000, "Bicimensajeros en el camino"),
          _itemSection("Finalizado", "Portal de las Americas, Bogota", "CC Tunal, Bogota", "05/09/2020 - 15:45", 25000, "Bicimensajeros en el camino"),
          _itemSection("Finalizado", "Portal de las Americas, Bogota", "CC Tunal, Bogota", "05/09/2020 - 15:45", 25000, "Bicimensajeros en el camino"),
          _itemSection("Finalizado", "Portal de las Americas, Bogota", "CC Tunal, Bogota", "05/09/2020 - 15:45", 25000, "Bicimensajeros en el camino"),
          _itemSection("Finalizado", "Portal de las Americas, Bogota", "CC Tunal, Bogota", "05/09/2020 - 15:45", 25000, "Bicimensajeros en el camino"),
          _itemSection("Finalizado", "Portal de las Americas, Bogota", "CC Tunal, Bogota", "05/09/2020 - 15:45", 25000, "Bicimensajeros en el camino"),
        ],
      ),
    );
  }

  Widget _itemSection(String status, String origin, String destination, String date, double price, String company){
    return DefaultContainer(
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(status, style: titleBlack3,),
          SizedBox(height: 10,),
          Row(
            children: [
              Text("Origen: ", style: titleBlack4,),
              Text(origin, style: textBlack4,),
            ],
          ),
          Row(
            children: [
              Text("Destino: ", style: titleBlack4,),
              Text(destination, style: textBlack4,),
            ],
          ),
          Row(
            children: [
              Text("Fecha: ", style: titleBlack4,),
              Text(date, style: textBlack4,),
            ],
          ),
          Row(
            children: [
              Text("Precio: ", style: titleBlack4,),
              Text("\$$price", style: textBlack4,),
            ],
          ),
          Row(
            children: [
              Text("Empresa: ", style: titleBlack4,),
              Text(company, style: textBlack4,),
            ],
          ),
          SizedBox(height: 10,),
          FlatButton(
            onPressed: (){},
            child: Text("Ver detalles", style: titleGreen3,),
          ),
        ],
      ),
    );
  }
}