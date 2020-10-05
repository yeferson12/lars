import 'dart:io';

import 'package:bikeu/providers/auth_provider.dart';
import 'package:bikeu/providers/provider_bloc.dart';
import 'package:bikeu/providers/provider_form.dart';
import 'package:bikeu/utils/constants.dart';
import 'package:bikeu/widgets/custom_appbar.dart';
import 'package:bikeu/widgets/custom_drawer_menu.dart';
import 'package:intl/intl.dart';
import 'package:image_picker/image_picker.dart';
import 'package:checkbox_formfield/checkbox_formfield.dart';
import 'package:select_form_field/select_form_field.dart';
import 'package:bikeu/widgets/default_container.dart';
import 'package:dropdownfield/dropdownfield.dart';
import 'package:flutter/material.dart';

import 'package:path_provider/path_provider.dart';

class Formulario extends StatefulWidget {
  @override
  _FormularioState createState() => _FormularioState();
}

String listaDocumentos = "";
DateTime _data = DateTime.now();
String _fecha = '';
String name = '';
String email = '';
String phone = '';
String tipoDni='';
String document = '';
String ciudad = '';
String address = '';
String fecha = '';
String transporte = '';
var foto;
 File _image;
final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
TextEditingController _insetarFecha = new TextEditingController();

class _FormularioState extends State<Formulario> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final authProvider = new FormProvider();
  bool backActive;
  Function backFuction;
  bool _check = false;
  bool _check1 = false;
  bool _check2 = false;
  bool _check3 = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        drawer: CustomDrawerMenu(),
        body: SafeArea(
            child: Form(
          key: _formkey,
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
        )));
  }

/*
  *@_buildContent: contiene todo el contenido y las funciones
*/
  Widget _buildContent(BuildContext context) {
    final bloc = Providerr.of(context);
    final size = MediaQuery.of(context).size;
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        height: size.height - 60,
        width: size.width,
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          children: [
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              _titulo(),
              _headerSection(bloc),
              SizedBox(height: 10),
              _nameSection(bloc),
              SizedBox(height: 10),
              _agregarFoto(),
              SizedBox(height: 10),
              _infoSection(bloc),
              _titel2(),
              _pdf(),
              _titel3(),
              SizedBox(height: 10),
              _checkBox1(),
              _checkBox2(),
              _register(bloc)
            ])
          ],
        ));
  }

  /*
  *@_headerSection: primera seccion del formulario
*/
  Widget _headerSection(LoginBloc bloc) {
    return Card(
      child: Column(
        children: [
          _name(bloc),
          _email(bloc),
          _phone(bloc),
        ],
      ),
    );
  }

/*
  *@_nameSection: segunda seccion del formulario
*/
  Widget _nameSection(LoginBloc bloc) {
    return Card(
      child: Column(
        children: [
          _tipodocumento(bloc),
          _noDocumento(bloc),
        ],
      ),
    );
  }

/*
  *@_infoSection: Tercera seccion del formulario
*/
  Widget _infoSection(LoginBloc bloc) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _ciudad(bloc),
          Row(
            children: [
              Checkbox(
                value: _check,
                onChanged: (_check3)
                    ? null
                    : (valor) {
                        setState(() {
                          _check = valor;
                        });
                        if (_check) {
                          print('Hombre');
                        }
                      },
              ),
              Text('Hombre'),
              Checkbox(
                value: _check3,
                onChanged: (_check)
                    ? null
                    : (valor) {
                        setState(() {
                          _check3 = valor;
                        });
                        if (_check3) {
                          print('Mujer');
                        }
                      },
              ),
              Text('Mujer'),
            ],
          ),
          _address(bloc),
          Container(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: TextFormField(
              controller: _insetarFecha,
              style: textGreenDark4,
              decoration: InputDecoration(
                labelStyle: textBlack4.copyWith(color: greenDarkColor),
                labelText: "Fecha de Nacimeinto",
              ),
              validator: (String value) {
                if (value.isEmpty) {
                  return 'la fecha de nacimiento es requerida';
                }
              },
              onSaved: (String value) {
                fecha = value;
              },
              onTap: () {
                FocusScope.of(context)
                    .requestFocus(new FocusNode()); //me inhabilita el input
                _selectDate(context);
              },
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 10, right: 10, bottom: 25),
            child: SelectFormField(
              labelText: 'Medio de transporte',
              items: _items2,
              onChanged: (val) => print(val),
              onSaved: (val) => print(val),
              validator: (String value) {
                if (value.isEmpty) {
                  return 'el tansporte es requerido';
                }
              },
            ),
          ),
        ],
      ),
    );
  }



/*
  *@_titulo: Titulo inicial
*/
  Widget _titulo() {
    return Center(
      child: Container(
        margin: EdgeInsets.only(bottom: 25),
        child: Text('Registrarse como Operador BikeU',
            style: TextStyle(
                color: Color.fromRGBO(69, 79, 99, 1),
                fontWeight: FontWeight.bold,
                fontSize: 18.0)),
      ),
    );
  }

/*
  *@_titel2: segundo titulo se encuentra en la parte superior
  *  del boton para descargar el pdf
*/
  Widget _titel2() {
    return Column(
      children: [
        Container(
          alignment: Alignment.bottomCenter,
          margin: EdgeInsets.only(top: 12),
          child: Text('Sube tus documentos para',
              style: TextStyle(
                  color: Color.fromRGBO(69, 79, 99, 1),
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0)),
        ),
        Container(
          margin: EdgeInsets.only(bottom: 12),
          child: Text('Completar el registro',
              style: TextStyle(
                  color: Color.fromRGBO(69, 79, 99, 1),
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0)),
        ),
      ],
    );
  }

/*
  *@_pdf: boton para descargar el pdf
*/
  Widget _pdf() {
    return Card(
        child: Container(
            padding: EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
            alignment: Alignment.bottomCenter,
            child: Text(
              'Documento de identiad',
              style: TextStyle(
                color: Color.fromRGBO(120, 132, 158, 1),
                fontSize: 16,
              ),
            )));
  }

/*
  *@_titel3: Tercer titulo se encuentra en la parte inferior del pdf
*/
  Widget _titel3() {
    return Column(
      children: [
        Container(
          alignment: Alignment.bottomCenter,
          child: Text('Carga un documento en PDF que',
              style: TextStyle(
                  color: Color.fromRGBO(120, 132, 158, 1),
                  fontWeight: FontWeight.bold,
                  fontSize: 13.0)),
        ),
        Container(
          //margin: EdgeInsets.only(bottom:43),
          child: Text('contenga ambos lados del documento',
              style: TextStyle(
                  color: Color.fromRGBO(120, 132, 158, 1),
                  fontWeight: FontWeight.bold,
                  fontSize: 13.0)),
        ),
      ],
    );
  }

/*
  *@_checkBox1: terminos y condiciones
*/
  Widget _checkBox1() {
    return Row(
      children: [
        Checkbox(
          value: _check1,
          onChanged: (valor) {
            setState(() {
              _check1 = valor;
            });
          },
        ),
        Text(
          'Acepto terminnos y condiciones',
          style: TextStyle(color: Color.fromRGBO(120, 132, 158, 1)),
        ),
      ],
    );
  }

/*
  *@_checkBox2: tratamiento de datos
*/
  Widget _checkBox2() {
    return Row(
      children: [
        Checkbox(
          value: _check2,
          onChanged: (valor) {
            setState(() {
              _check2 = valor;
            });
          },
        ),
        Text('Acepto tratamiento de datos personales',
            style: TextStyle(color: Color.fromRGBO(120, 132, 158, 1))),
      ],
    );
  }

/*
  *@_register: boton para registrarse
*/
  Widget _register(LoginBloc bloc) {
    return StreamBuilder(
      stream: bloc.validarForm,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Container(
            child: GestureDetector(
                onTap: snapshot.hasData ? () => _valores(bloc, context, _image) : null,
                child: new Container(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  margin: EdgeInsets.only(bottom: 53),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(0, 191, 242, 1),
                      borderRadius: BorderRadius.circular(50)),
                  child: Center(
                      child: Text(
                    "ENVIAR DATOS DE REGISTRO",
                    style: TextStyle(
                      fontSize: 12,
                      color: whiteColor,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
                )));
      },
    );
  }
/*
  *@_selectDate: esta funcion hace la funcionalidad de la fecha sasca el calendario
*/
  void _selectDate(BuildContext context) async {
    showDatePicker(
            context: context,
            initialDate: new DateTime.now(), //hora actual
            firstDate: new DateTime(2018), //fecha de inicio
            lastDate: new DateTime(2025), //fecha fin
            locale: Locale('es', 'ES'))
        .then((newDate) {
      if (newDate != null) {
        setState(() {
          _data = newDate; //le doy a fecha el volor que ingresen
          _fecha =
              "${_data.year.toString().padLeft(2, '0')}-${_data.month.toString().padLeft(2, '0')}-${_data.day.toString().padLeft(2, '0')}";
          _insetarFecha.text = _fecha;
        });
      }
    });
  }
/*
  *@_name: nombre del usuario que se registra
*/
  Widget _name(LoginBloc bloc) {
    return StreamBuilder(
      stream: bloc.nameStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Container(
          padding: EdgeInsets.only(left: 10, right: 10, top: 15),
          child: TextFormField(
            style: textGreenDark4,
            decoration: InputDecoration(
                labelStyle: textBlack4.copyWith(color: greenDarkColor),
                labelText: "Nombre",
                errorText: snapshot.error),
            onChanged: bloc.changeName,
          ),
        );
      },
    );
  }
/*
  *@_email: email del usuario que se registra
*/
  Widget _email(LoginBloc bloc) {
    return StreamBuilder(
        stream: bloc.emailStream,
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          return Container(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: TextFormField(
              style: textGreenDark4,
              decoration: InputDecoration(
                  labelStyle: textBlack4.copyWith(color: greenDarkColor),
                  labelText: "Correo Electronico",
                  errorText: snapshot.error),
              onChanged: bloc.changeEmail,
            ),
          );
        });
  }
/*
  *@_phone: celular  del usuario que se registra
*/
  Widget _phone(LoginBloc bloc) {
    return StreamBuilder(
        stream: bloc.phoneStream,
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          return Container(
            padding: EdgeInsets.only(left: 10, right: 10, bottom: 35),
            child: TextFormField(
              style: textGreenDark4,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelStyle: textBlack4.copyWith(color: greenDarkColor),
                  labelText: "Numero de Telefono",
                  errorText: snapshot.error),
              onChanged: bloc.changePhone,
            ),
          );
        });
  }
/*
  *@_tipodocumento: tipo de documneto del usuario que se registra
*/
  Widget _tipodocumento(LoginBloc bloc) {
    return StreamBuilder(
        stream: bloc.tipoDniStream,
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
               return Container(
      color: Colors.white,
      padding: EdgeInsets.only(left: 10, right: 10, top: 15),
      child: SelectFormField(
        labelText: 'Tipo de documento',
        items: _items,
        onChanged: (val) => bloc.changeTipoDni,
        onSaved: (val) => print(val),
        validator: (String value) {
          if (value.isEmpty) {
            return 'El tipo de documento es requerido';
          }
        },
      ),
    );
             
        },
    );



    
  }
/*
  *@_noDocumento: noDocumento del usuario que se registra
*/
  Widget _noDocumento(LoginBloc bloc) {
    return StreamBuilder(
        stream: bloc.documentStream,
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          return Container(
            padding: EdgeInsets.only(left: 10, right: 10, bottom: 25),
            child: TextFormField(
              style: textGreenDark4,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelStyle: textBlack4.copyWith(color: greenDarkColor),
                  labelText: "Numero de Documento",
                  errorText: snapshot.error),
              onChanged: bloc.changeDocument,
            ),
          );
        });
  }
/*
  *@_ciudad: del usuario que se registra
*/
  Widget _ciudad(LoginBloc bloc) {
    return StreamBuilder(
        stream: bloc.ciudadStream,
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          return Container(
            padding: EdgeInsets.only(left: 10, right: 10, top: 15),
            child: TextFormField(
              style: textGreenDark4,
              decoration: InputDecoration(
                  labelStyle: textBlack4.copyWith(color: greenDarkColor),
                  labelText: "Ciudad donde haras las entregas",
                  errorText: snapshot.error),
              onChanged: bloc.changeCiudad,
            ),
          );
        });
  }
/*
  *@_address: del usuari que se registra
*/
  Widget _address(LoginBloc bloc) {
    return StreamBuilder(
        stream: bloc.addresStream,
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          return Container(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: TextFormField(
              style: textGreenDark4,
              decoration: InputDecoration(
                  labelStyle: textBlack4.copyWith(color: greenDarkColor),
                  labelText: "Direccion",
                  errorText: snapshot.error),
              onChanged: bloc.changeAddress,
            ),
          );
        });
  }
/*
  *@_valores: esta funcion cumple con mandar los parametros al provider validar las casilla
  * y redirigue a otra pagina 
*/
  _valores(LoginBloc bloc, BuildContext context, File _imagen) async{
    if (!_formkey.currentState.validate()) {
      return;
    }
    _formkey.currentState.save();

    authProvider.formatoUser(
       bloc.name, bloc.document, bloc.email, bloc.phone, bloc.address, bloc.ciudad,_imagen,bloc.tipoDni);
    Navigator.pushReplacementNamed(context, "pendiente");
  }
/*
  *@_agregarFoto: esta es la seccion en la que el usuairo puede agreggar y mirar su foto
*/
  Widget _agregarFoto() {
    return Card(
      child: Column(
        children: [
          Container(
            child: RaisedButton(
              onPressed: _seleccionarFoto,
              color: greenColor,
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Container(
                alignment: Alignment.bottomCenter,
                child: Row(
                  children: [
                    Image(
                      height: 20,
                      image: AssetImage("assets/img/png/mechanics-white.png"),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "Subien una foto".toUpperCase(),
                      style: titleWhite5,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
              margin: EdgeInsets.only(bottom: 20, top: 20),
              child: _mostrarFoto()),
        ],
      ),
    );
  }
/*
  *@_mostrarFoto: esta funcion muestra foto en pantalla despues que el usuario loa haya selecionado
*/
  Widget _mostrarFoto() {
    return Image(
      image: AssetImage(foto?.path ?? 'assets/img/png/no-image.png'),
      height: 300.0,
      fit: BoxFit.cover,
    );
  }
/*
  *@_seleccionarFoto:
*/
  _seleccionarFoto() async {
    final _picker = ImagePicker();
  
    PickedFile _foto = await _picker.getImage(source: ImageSource.gallery, imageQuality: 10);

    foto = _foto;
    if (_foto != null) {}

    setState(() {
     _image = File(_foto.path);
    });
  }
}

/*
 Lista para los selectores 
*/
final List<Map<String, dynamic>> _items2 = [
  {
    'value': 'Bicicleta',
    'label': 'Bicicleta',
  },
  {
    'value': 'Bike Cargo',
    'label': 'Bike Cargo',
  },
  {
    'value': 'Otros',
    'label': 'Otro',
  },
];

/*
 Lista para los selectores 
*/
final List<Map<String, dynamic>> _items = [
  {
    'value': 'Cedula de ciudadania',
    'label': 'CC-Cedula de ciudadania',
  },
  {
    'value': 'Cedula de extranjeria',
    'label': 'CE-Cedula de extranjeria',
  },
  {
    'value': 'Permiso de trabajo',
    'label': 'PEP-Permiso de trabajo',
  },
];
