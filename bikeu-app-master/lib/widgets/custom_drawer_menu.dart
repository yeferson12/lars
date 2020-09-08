import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';

import 'package:bikeu/utils/constants.dart';

class CustomDrawerMenu extends StatefulWidget {
  @override
  _CustomDrawerMenuState createState() => _CustomDrawerMenuState();
}

class _CustomDrawerMenuState extends State<CustomDrawerMenu> {

  bool mechanics = false;
  bool messaging = false;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: SafeArea(
          child: ListView(
            children: [
              _servicesMenu(),
              Divider(),
              if(!mechanics && !messaging) _requestService(),
              _mainMenu(),
              Divider(),
              _preferencesMenu(),
              Divider(),
              _aboutMenu(),
              Divider(),
              SizedBox(height: 10,),
              _bottomSection(),
              SizedBox(height: 10,),
            ],
          ),
        ),
      ),
    );
  }

  Widget _servicesMenu(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 5,),
        Text("¿Prestas algún servicio?", style: textGrey5,),
        Row(
          children: [
            Switch(
              activeColor: greenDarkColor,
              onChanged: (value){
                setState(() {
                  mechanics = value;
                });
              },
              value: mechanics,
            ),
            Text("Bicimecánico".toUpperCase(), style: titleOrange3,),
          ],
        ),
        Row(
          children: [
            Switch(
              activeColor: greenDarkColor,
              onChanged: (value){
                setState(() {
                  messaging = value;
                });
              },
              value: messaging,
            ),
            Text("Bicimensajero".toUpperCase(), style: titleGreen3,),
          ],
        ),
      ],
    );
  }

  Widget _requestService(){ 
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 5,),
        Text("Actualmente tienes servicios activos", style: textGrey5,),
        SizedBox(height: 5,),
        Container( 
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 6),
                child: GestureDetector(
                  onTap: (){
                    Navigator.of(context).pushNamed("home");
                  },
                  child: Text("Solicitar un nuevo servicio", style: titleBlack4.copyWith(color: Color.fromRGBO(0, 181, 241, 1)),)
                ),
              ),
            ],
          ),
        ),
        Divider(),
      ],
    );
  }

  Widget _mainMenu(){ 
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 5,),
        Text("Menú principal", style: textGrey5,),
        SizedBox(height: 5,),
        Container( 
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _itemLink("Inicio", "home"),
              if(!mechanics && !messaging) _itemLink("Servicios en curso", "ongoing-services"),
              if(mechanics || messaging) _itemLink("Servicios en curso", "ongoing-services-operator"),
              _itemLink("Servicios programados", "sheduled-services"),
              if(mechanics || messaging) _itemLink("Servicios prestados", "provided-services"),
              _itemLink("Historial de servicios solicitados", "requested-services"),
              _itemLink("Cerrar Sesión", "login"),
            ],
          ),
        ),
      ],
    );
  }

  Widget _preferencesMenu(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 5,),
        Text("Promociones y ayuda", style: textGrey5,),
        SizedBox(height: 5,),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _itemLink("Promociones", "promotions"),
              _itemLink("Ayuda y Soporte", "help"),
              _itemLink("Mi Perfil", "my-profile"),
              _itemLink("FAQ", "faq"),
              _itemLink("Cerrar Sesión", "home"),
            ],
          ),
        ),
      ],
    );
  }

  Widget _aboutMenu(){ 
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 5,),
        Text("Acerca de BikeU", style: textGrey5,),
        SizedBox(height: 5,),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 6),
                child: Row(
                  children: [
                    Text("Siguenos en", style: titleBlack4,), 
                    SizedBox(width: 20,),
                    GestureDetector(
                      onTap: (){
                        _launchURL("https://www.facebook.com/");
                      },
                      child: Image(
                        height: 34,
                        image: AssetImage("assets/img/png/facebook.png"),
                      ),
                    ), 
                    GestureDetector(
                      onTap: (){
                        _launchURL("https://www.instagram.com/");
                      },
                      child: Image( 
                        height: 38, 
                        image: AssetImage("assets/img/png/instagram.png"), 
                      ),
                    ),
                  ],
                )
              ),
              _itemLink("Términos y condiciones", "terms-conditions"),
              _itemLink("Calificanos", "home"),
              Container(
                padding: EdgeInsets.symmetric(vertical: 6),
                child: GestureDetector(
                  onTap: (){
                    Navigator.of(context).pushNamed("");
                  },
                  child: GestureDetector(
                    onTap: (){
                      _launchURL("http://www.bikeu.com.co");
                    },
                    child: Text("www.bikeu.com.co", style: textBlack4.copyWith(decoration: TextDecoration.underline, color: Color.fromRGBO(0, 181, 241, 1)),)
                  )
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _bottomSection(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("Version 2.0", style: textBlack6.copyWith(color: greyColor),),
        GestureDetector(
          onTap: (){
            _launchURL("http://lars.net.co");
          },
          child: Text("Desarrollado por LARS Software Company", style: textBlack6.copyWith(decoration: TextDecoration.underline, color: greyColor), )
        ),
      ],
    );
  }

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      //throw 'Could not launch $url';
    }
  }

  Widget _itemLink(String text, String route){
    return Container(
      padding: EdgeInsets.symmetric(vertical: 6),
      child: GestureDetector(
        onTap: (){
          Navigator.of(context).pushNamed(route);
        },
        child: Text(text, style: titleBlack4,)
      ),
    );
  }
}