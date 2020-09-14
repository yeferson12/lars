import 'package:bikeu/widgets/default_container.dart';
import 'package:bikeu/widgets/rating.dart';
import 'package:flutter/material.dart';

import '../utils/constants.dart';
import '../widgets/custom_appbar.dart';
import '../widgets/custom_drawer_menu.dart';

class MyProfile extends StatefulWidget {
  @override
  _MyProfileState createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {

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
          _nameSection(),
          _infoSection(),
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
            radius: 42,
            child: CircleAvatar(
              radius: 40,
              backgroundImage: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSMFS8axeLfkZEHmwiwACr2g903NIxXHG-Dcg&usqp=CAU"),
            ),
          ),
          SizedBox(width: 10,),
          Column( 
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Perfil de usuario", style: titleGreenDarkColor2,),
              Text("Bicimensajero - Bicimecanico", style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),),
              Text("Bicimensajeros de bogota", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
              SizedBox(height: 10,),
              Rating(value: 4, size: 25,), 
            ],
          ),
        ],
      ),
    ); 
  }

  Widget _nameSection(){
    return DefaultContainer(
      content: Column(
        children: [
          TextFormField(
            initialValue: "John",
            style: textGreenDark4,
            decoration: InputDecoration(
              labelStyle: textBlack4.copyWith(color: greenDarkColor),
              labelText: "Nombre",
              suffixIcon: Icon(Icons.arrow_forward_ios, size: 18, color: greenDarkColor,),
            ),
          ),
          TextFormField(
            initialValue: "Doe",
            style: textGreenDark4,
            decoration: InputDecoration(
              labelStyle: textBlack4.copyWith(color: greenDarkColor),
              labelText: "Apellido",
              suffixIcon: Icon(Icons.arrow_forward_ios, size: 18, color: greenDarkColor,),
            ),
          ),
        ],
      ),
    );
  }

  Widget _infoSection(){
    return DefaultContainer(
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            initialValue: "johndoe@domain.com",
            style: textGreenDark4,
            decoration: InputDecoration(
              labelStyle: textBlack4.copyWith(color: greenDarkColor),
              labelText: "Correo electronico",
              suffixIcon: Icon(Icons.arrow_forward_ios, size: 18, color: greenDarkColor,),
            ),
          ),
          TextFormField(
            initialValue: "+57 1425412541",
            style: textGreenDark4,
            decoration: InputDecoration(
              labelStyle: textBlack4.copyWith(color: greenDarkColor),
              labelText: "Numero de telefono",
              suffixIcon: Icon(Icons.arrow_forward_ios, size: 18, color: greenDarkColor,),
            ),
          ),
          SizedBox(height: 20,),
          FlatButton(
            onPressed: (){},
            child: Text("Cambiar contraseña", style: textBlack4.copyWith(color: greenDarkColor),),
          ),
          FlatButton(
            onPressed: (){},
            child: Text("Eliminar mi cuenta", style: textBlack4.copyWith(color: greenDarkColor),),
          ),
          
        ],
      ),
    );
  }
}