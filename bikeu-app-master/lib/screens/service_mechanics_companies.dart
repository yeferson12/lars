

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../models/company.dart';
import '../providers/companies_provider.dart';
import '../providers/services_provider.dart';
import '../utils/constants.dart';
import '../widgets/custom_appbar.dart';
import '../widgets/custom_drawer_menu.dart';
import '../widgets/rating.dart';
import '../widgets/icon_text_button.dart';
import '../widgets/custom_default_button.dart';

class ServiceMechanicsCompanies extends StatefulWidget {
  @override
  _ServiceMechanicsCompaniesState createState() => _ServiceMechanicsCompaniesState();
}

class _ServiceMechanicsCompaniesState extends State<ServiceMechanicsCompanies> {
  
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  int selectedItem;
  
  @override
  Widget build(BuildContext context) {
    final serviceProvider = Provider.of<ServicesProvider>(context);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: IconTextButton(
        text: "Solicitar",
        color: orangeColor,
        width: size.width*0.4,
        height: 40,
        icon: Icons.arrow_forward,
        function: (){ 
          if(selectedItem != null){
            Navigator.of(context).pushNamed("service-operator"); 
          }else{
            Fluttertoast.showToast(
              msg: "Selecciona una empresa",
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
            _addressContainer("Dirección:", serviceProvider.destinationAddres.toString()),
           _serviceContainer(
              context,
              "Solicitaste 2 servicios", 
              "Pinchaso y cadena",
              "assets/img/png/icon-mechanics.png"
            ), 
            _observationsContainer(),
            _companiesContainer(),
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

  Widget _serviceContainer(BuildContext context, String label, String text, image){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
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
                  child: Container(
                    alignment: Alignment.centerRight,
                    child: CustomDefaultButton(
                      text: "Quitar",
                      color: purpleColor,
                      function: (){},
                      textStyle: titleWhite4,
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _observationsContainer(){
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Observaciones", style: textGreenDark4,),
          TextField(
            decoration: InputDecoration(
              border: InputBorder.none,
            ),
            maxLines: 3,
          ),
        ],
      ),
    );
  }

  Widget _companiesContainer(){
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Empresas BikeU cercanas", style: titleGreenDarkColor3,),
          SizedBox(height: 5,),
          Text("Selecciona una de las empresas afiliadas a BikeU con mensajeros cerca de tu ubicación", style: textGreenDark5,),
          SizedBox(height: 8,),
          Container(
            height: 400,
            child: Consumer<CompaniesProvider>(
              builder: (ctx, companiesProvider, _){
                return Padding(
                  padding: EdgeInsets.all(5), 
                  child: ListView.builder(
                    itemCount: companiesProvider.items.length,
                    itemBuilder: (ctx, index){
                      return _companyItem(companiesProvider.items[index], index);
                    }
                  ),
                );
              }
            ),
          )
        ],
      ),
    );
  }

  Widget _companyItem(Company company, item){
    return GestureDetector(
      onTap: (){
        setState(() {
          selectedItem = item;
        });
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: selectedItem == item ? greybackgroundColor : whiteColor,
          borderRadius: BorderRadius.circular(40),
        ),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: CircleAvatar(
                radius: 37,
                backgroundImage: NetworkImage(company.image),
              ),
            ),
            SizedBox(width: 10,),
            Expanded(
              flex: 5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Rating(value: 4,size: 25,),
                  SizedBox(height: 2,),
                  Text(company.name, style: titleGreenDarkColor5 ,),
                  Text("\$12.000", style: titleGreenDarkColor3,),
                  Text("a 2 hilómetros de tu ubicación", style: textGreenDark5,),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}