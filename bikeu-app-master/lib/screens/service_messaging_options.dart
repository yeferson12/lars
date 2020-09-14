import 'package:flutter/material.dart';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

import '../utils/constants.dart';
import '../widgets/custom_appbar.dart';
import '../widgets/custom_drawer_menu.dart';
import '../widgets/icon_text_button.dart';
import '../providers/services_provider.dart';

class ServiceMessagingOptions extends StatefulWidget {
  @override
  _ServiceMessagingOptionsState createState() => _ServiceMessagingOptionsState();
}

class _ServiceMessagingOptionsState extends State<ServiceMessagingOptions> {

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
        text: "Siguiente",
        width: size.width*0.4,
        height: 40,
        icon: Icons.arrow_forward,
        function: (){ 
          if(_peso != null && _volumen != null && selectedItem != null){
            Navigator.of(context).pushNamed("service-messaging-companies"); 
          }else{
            Fluttertoast.showToast(
              msg: "Selecciona el peso, volumen y el tipo de servicio",
              toastLength: Toast.LENGTH_SHORT,
              backgroundColor: greenDarkColor,
              textColor: Colors.white
            );
          }
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
            _addressContainer("Origen:", serviceProvider.originAddress.toString()),
            _addressContainer("Destino:", serviceProvider.destinationAddres.toString()),
            _pesoContainer(serviceProvider),
            _volumenContainer(serviceProvider),
            Container(
              margin: EdgeInsets.only(top: 10),
              padding: EdgeInsets.only(left: 10),
              alignment: Alignment.centerLeft, 
              child: Text("¿Que tipo de servicio deseas?", style: titleGreen3, textAlign: TextAlign.left,)
            ),
            _serviceContainer(
              context,
              "Servicio Estándar", 
              "En el servicio estándar, tu pedido será realizado por un (1) Bicimensajero, es decir que tu pedido será mucho más económico",
              1,
              "assets/img/png/icon-messaging.png"
            ),
            _serviceContainer(
              context,
              "Servicio Estándar", 
              "En el servicio exprés, tu pedido será realizado por varios Bicimensajeros, es decir que tu pedido será entregado muchisimo más económico",
              2,
              "assets/img/png/express.png"
            ),
            _serviceContainer(
              context,
              "Servicio Estándar", 
              "Programa tu servicio de mensajería para despues",
              3,
              "assets/img/png/sheduled.png"
            ),
            SizedBox(height: 100,),
          ],
        ),
      ),
    );
  }

  Widget _pesoContainer(ServicesProvider serviceProvider){
    
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
          Text("Peso: ", style: textGreenDark4,),
          SizedBox(width: 8,),
          Expanded(
            child: DropdownButton(
              value: _peso,
              isExpanded: true,
              onChanged: (value){
                setState(() {
                  _peso = value;
                  serviceProvider.weight = value;
                });
              },
              items: [
                DropdownMenuItem<String>(
                  value: "Liviano",
                  child: new Text("Liviano"),
                ),
                DropdownMenuItem<String>(
                  value: "Mediano",
                  child: new Text("Mediano"),
                ),
                DropdownMenuItem<String>(
                  value: "Pesado",
                  child: new Text("Pesado"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _volumenContainer(ServicesProvider serviceProvider){
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
          Text("Volumen: ", style: textGreenDark4,),
          SizedBox(width: 8,),
          Expanded(
            child: DropdownButton(
              value: _volumen,
              isExpanded: true,
              onChanged: (value){
                setState(() {
                  _volumen = value;
                  serviceProvider.volume = value;
                });
              },
              items: [
                DropdownMenuItem<String>(
                  value: "Pequeño",
                  child: new Text("Pequeño"),
                ),
                DropdownMenuItem<String>(
                  value: "Mediano",
                  child: new Text("Mediano"),
                ),
                DropdownMenuItem<String>(
                  value: "Grande",
                  child: new Text("Grande"),
                ),
              ],
            ),
          ),
        ],
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
        padding: EdgeInsets.symmetric(horizontal: 18, vertical: 18),
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
          ],
        ),
      ),
    );
  }
}