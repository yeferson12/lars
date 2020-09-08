import 'package:bikeu/widgets/custom_default_button.dart';
import 'package:flutter/material.dart';

import '../utils/constants.dart';
import '../widgets/custom_appbar.dart';
import '../widgets/custom_drawer_menu.dart';

class OngoingServicesOperator extends StatefulWidget {
  @override
  _OngoingServicesOperatorState createState() =>
      _OngoingServicesOperatorState();
}

class _OngoingServicesOperatorState extends State<OngoingServicesOperator> {
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
              CustomAppbar(
                backActive: false,
                backFuction: () {},
                scaffoldKey: _scaffoldKey,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      height: size.height - 60,
      width: size.width,
      child: ListView(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Servicios En Curso",
                  style: titleBlack2,
                ),
                Text(
                  "Se listan todos los servicios que tienes activos.",
                  style: textBlack5,
                ),
                Divider(
                  height: 20.0,
                  thickness: 0.5,
                  color: greyColor,
                ),
              ],
            ),
          ),
          _itemSection("Bicimensajeria", "\$12.000,00", "Cadila Macano",
              "Pequeño", "Mediano", "4", "Cll 1 #2-3", "Cll 1 #2-3"),
          _itemSection("Bicimensajeria", "\$12.000,00", "Cadila Macano",
              "Pequeño", "Mediano", "4", "Cll 1 #2-3", "Cll 1 #2-3"),
          _itemSection("Bicimensajeria", "\$12.000,00", "Cadila Macano",
              "Pequeño", "Mediano", "4", "Cll 1 #2-3", "Cll 1 #2-3"),
          _itemSection("Bicimensajeria", "\$12.000,00", "Cadila Macano",
              "Pequeño", "Mediano", "4", "Cll 1 #2-3", "Cll 1 #2-3"),
          SizedBox(height: 40,),
        ],
      ),
    );
  }

  Widget _itemSection(
      String service,
      String price,
      String operatorName,
      String packageSize,
      String packageWeight,
      String deliveries,
      String nextStop,
      String destination) {
    final size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(20), boxShadow: [
        BoxShadow(
          blurRadius: 5,
          color: shadowColor,
          offset: Offset(0, 0),
          spreadRadius: 1,
        ),
      ]),
      child: Column(
        children: [
          _headerItem(service, price, operatorName),
          _bodyItem(packageSize, packageWeight, deliveries, nextStop, destination),
        ],
      ),
    );
  }

  Widget _bodyItem(String packageSize, String packageWeight, String deliveries, String nextStop, String destination) {
    return Container(
      color: whiteColor,
      padding: EdgeInsets.symmetric(
        horizontal: 5.0,
        vertical: 8.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Table(
            columnWidths: {
              0: FixedColumnWidth(130.0),
              1: FixedColumnWidth(90.0)
            },
            border: TableBorder.all(
                color: Colors.black26,
                width: 1.0,
                style: BorderStyle.none),
            children: [
              _tableRowItem("Tamaño del paquete:", packageSize),
              _tableRowItem("Peso:", packageWeight),
              _tableRowItem("Entregas:", deliveries),
              _tableRowItem("Próxima Parada:", nextStop),
              _tableRowItem("Destino:", destination),
            ],
          ),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Container(
                  height: 28.0,
                  margin: EdgeInsets.only(bottom: 8.0),
                  child: RaisedButton(
                    color: blueColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                    onPressed: (){},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text("-9 gr.", style: titleWhite5,),
                      ],
                    ),
                  ),
                ),
                CustomDefaultButton(
                  color: greenColor,
                  text: "Navegar",
                  textStyle: titleWhite5,
                  height: 28.0,
                  function: () {},
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  TableRow _tableRowItem(String label, String value) {
    return TableRow(
      children: [
        TableCell(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 2.0),
            child: Text(label),
          ),
        ),
        TableCell(
          child: Container(
            child: Text(value),
            padding: EdgeInsets.symmetric(vertical: 2.0),
          ),
        ),
      ],
    );
  }

  Widget _headerItem(String service, String price, String operatorName) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10.0),
          topRight: Radius.circular(10.0),
        ),
        color: blueDrakColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      service,
                      style: textWhite4,
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    Text(
                      price,
                      style: textWhite4,
                    ),
                  ],
                ),
                SizedBox(
                  height: 3.0,
                ),
                Row(
                  children: <Widget>[
                    Text(
                      "Operador: ",
                      style: textWhite4,
                    ),
                    Text(
                      operatorName,
                      style: textWhite4,
                    ),
                  ],
                )
              ],
            ),
          ),
          Container(
            child: Image(
              height: 32.0,
              image: AssetImage("assets/img/png/simple-messaging.png"),
            ),
          ),
        ],
      ),
    );
  }
}
