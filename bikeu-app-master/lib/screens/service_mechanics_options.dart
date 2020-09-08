
import 'package:flutter/material.dart';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

import '../utils/constants.dart';
import '../providers/services_provider.dart';
import '../widgets/custom_appbar.dart';
import '../widgets/custom_drawer_menu.dart';
import '../widgets/icon_text_button.dart';
import '../widgets/custom_default_button.dart';

class ServiceMechanicsOptions extends StatefulWidget {
  @override
  _ServiceMechanicsOptionsState createState() => _ServiceMechanicsOptionsState();
}

class _ServiceMechanicsOptionsState extends State<ServiceMechanicsOptions> {

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  String _peso;
  String _volumen;
  int selectedItem;
  
  @override
  Widget build(BuildContext context) {
    final serviceProvider = Provider.of<ServicesProvider>(context);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: IconTextButton(
        color: orangeColor,
        text: "Siguiente",
        width: size.width*0.4,
        height: 40,
        icon: Icons.arrow_forward,
        function: (){ 
          Navigator.of(context).pushNamed("service-mechanics-companies"); 
          /*
          if(_peso != null && _volumen != null && selectedItem != null){
            Navigator.of(context).pushNamed("service-mechanics-companies"); 
          }else{
            Fluttertoast.showToast(
              msg: "Selecciona al menos un servicio",
              toastLength: Toast.LENGTH_SHORT,
              backgroundColor: greenDarkColor,
              textColor: Colors.white
            );
          }
          */
        },
      ),
      drawer: CustomDrawerMenu(),
      body: SafeArea(
        child: Container(
          height: double.infinity,
          child: Stack(
            children: [
              Positioned(
                top: 60,
                child: _buildContent(context, serviceProvider),
              ),
              CustomAppbar(backActive: true, backFuction: (){ Navigator.of(context).pop(); },),
            ],
          ),
        ), 
      ),
    );
  }

  Widget _buildContent(BuildContext context, ServicesProvider serviceProvider){
    final size = MediaQuery.of(context).size;
    return Container(
      color: whiteColor,
      height: size.height-60,
      width: size.width,
      child: SingleChildScrollView(
        child: Column(
          children: [
            //_addressContainer("Origen:", serviceProvider.originAddress.toString()),
            _addressContainer("Dirección:", serviceProvider.destinationAddres.toString()),
            
            Container(
              margin: EdgeInsets.only(top: 10),
              padding: EdgeInsets.only(left: 10),
              alignment: Alignment.centerLeft, 
              child: Text("¿Que servicio deseas?", style: titleOrange3, textAlign: TextAlign.left,)
            ),
            _serviceContainer(
              context,
              "Cadena", 
              "Cambio o reparación de cadena, pernos o cualquier otro",
              1,
              "assets/img/png/icon-mechanics.png"
            ),
            _serviceContainer(
              context,
              "Pinchazo", 
              "Reparacion de caucho, tripa, aplicacion de parches. Remplazo de cauchos o tripas",
              2,
              "assets/img/png/icon-mechanics.png"
            ),
            _serviceContainer(
              context,
              "Engrase", 
              "Servicio de engrase en los accesorios ",
              3,
              "assets/img/png/icon-mechanics.png"
            ),
            SizedBox(height: 100,),
          ],
        ),
      ),
    );
  }

  Widget _addressContainer(String label, String text){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 18, vertical: 18),
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            blurRadius: 5,
            color: shadowColor,
            offset: Offset(0, 0),
            spreadRadius: 1,
          ),
        ]
      ),
      child: Row(
        children: [
          Expanded(flex: 1, child: Text(label, style: textGreenDark4,)),
          SizedBox(width: 8,),
          Expanded(flex: 3, child: Text(text, style: textBlack5,)),
        ],
      ),
    );
  }

  Widget _serviceContainer(BuildContext context, String label, String text, item, image){
    return GestureDetector(
      onTap: (){
        setState(() {
          selectedItem = item;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
          color: selectedItem == item ? greybackgroundColor : whiteColor,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              blurRadius: 5,
              color: shadowColor,
              offset: Offset(0, 0),
              spreadRadius: 1,
            ),
          ]
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(label, style: titleGreenDarkColor4,),
                  
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 0),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Text(text, style: textBlack5,),
                  ),
                  Expanded(
                    flex: 1,
                    child: Image(
                      height: 100,
                      image: AssetImage(image),
                    ),
                  )
                ],
              ),
            ),
            Container(
              alignment: Alignment.centerRight,
              child: CustomDefaultButton(
                text: "Agregar Servicio",
                color: darkOrangeColor,
                function: (){},
                textStyle: titleWhite4,
              ),
            ),
          ],
        ),
      ),
    );
  }
}