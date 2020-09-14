import 'dart:async';
import 'dart:io';

import 'package:bikeu/providers/auth_provider.dart';
import 'package:bikeu/providers/provider_bloc.dart';
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


class Formulario extends StatefulWidget {
  @override
  _FormularioState createState() => _FormularioState();
} 

    String listaDocumentos ="";
    DateTime _data = DateTime.now();
    String _fecha ='';
    String name ='';
    String email ='';
    String phone ='';
    String document ='';
    String ciudad ='';
    String address ='';
    String fecha ='';
    String transporte ='';
  
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  TextEditingController _insetarFecha =new TextEditingController();
   

class _FormularioState extends State<Formulario> {

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final authProvider = new AuthProvider();
    bool backActive;
    Function backFuction;
    bool _check=false;
    bool _check1=false;
    bool _check2=false;
    bool _check3=false;
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
              _appbar(),
              
            ],
          ),
              
                
                
            
            ),
            )
          )
            
        
      );
      
    
  }
/*
  *@_buildContent: contiene todo el contenido y las funciones
*/
 Widget _buildContent(BuildContext context){
    final bloc = Providerr.of(context);
    final size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      height: size.height-60,
      width: size.width,
      child: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        children: [
          Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
        ]
      )
        ],
      )
      
    );
  }

 /*
  *@_headerSection: primera seccion del formulario
*/ 
  Widget _headerSection(LoginBloc bloc){
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
  Widget _nameSection(LoginBloc bloc){
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
  Widget _infoSection(LoginBloc bloc){
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _ciudad(bloc),
          Row(
       children: [
         
          Checkbox(
             value: _check,
             onChanged: (_check3) ? null : (valor){
                   setState(() {
                     _check = valor;});
                     if(_check){
                 print('Hombre');
               } 
             },
           ),
          Text('Hombre'),
          Checkbox(
             value: _check3,
             onChanged:(_check) ? null : (valor){
                   setState(() {
                     _check3 = valor;});
               if(_check3){
                 print('Mujer');
               }      
             },
             
           ),
          Text('Mujer'),
       ],
     ),
          
             _address(bloc),
             Container(
               padding: EdgeInsets.only(left: 10,right:10 ),
               child: TextFormField(
            controller:_insetarFecha ,
            style: textGreenDark4,
            decoration: InputDecoration(
                labelStyle: textBlack4.copyWith(color: greenDarkColor),
                labelText: "Fecha de Nacimeinto",),
                validator: ( String value ){
                                if (value.isEmpty) {
                                  return 'la fecha de nacimiento es requerida';
                                }
                        },
                        onSaved: (String value){
                                fecha=value;
                        },
            onTap: (){
              FocusScope.of(context).requestFocus(new FocusNode());//me inhabilita el input
          _selectDate(context);
            },
          ),
             ),
          Container(
            padding: EdgeInsets.only(left: 10,right:10, bottom: 25),
            child: SelectFormField(
                 
                 labelText: 'Medio de transporte',
                 items: _items2,
                 onChanged: (val) => print(val),
                 onSaved: (val) => print(val),
                 validator: ( String value ){
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
  *@_appbar: 
*/
 Widget _appbar() {
   
    return Container(
         height: 60,
         padding: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
         child: Row(
           children: [
             Row(
               children: [
                 IconButton(
                onPressed: (){
                  
                },
                icon: Icon(Icons.menu, size: 28),
              ),
               SizedBox(width: 5,),
                IconButton(
                  onPressed: backFuction,
                  icon: Icon(Icons.arrow_back, size: 28),
                ),
               ],
               
             ),
             Expanded(child:SizedBox(width:5.0)),
               Container(
            padding: EdgeInsets.all(5),
            child: Image(
              image: AssetImage("assets/img/png/logo-3.png"),
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
               fontSize: 18.0 )),
          ),
     );
  }

/*
  *@_titel2: segundo titulo se encuentra en la parte superior
  *  del boton para descargar el pdf
*/
 Widget _titel2() {
      return Column(children: [
        
         Container(
            alignment: Alignment.bottomCenter,
            margin: EdgeInsets.only(top:12),
           child: Text('Sube tus documentos para',
           style: TextStyle(
              
              color: Color.fromRGBO(69, 79, 99, 1),
               fontWeight: FontWeight.bold,
               fontSize: 18.0 )),
         ),
         Container(
            margin: EdgeInsets.only(bottom:12),
           child: Text('Completar el registro',
           style: TextStyle(
              color: Color.fromRGBO(69, 79, 99, 1),
               fontWeight: FontWeight.bold,
               fontSize: 18.0 )),
         ),
      ],);
  }

/*
  *@_pdf: boton para descargar el pdf
*/
 Widget _pdf() {
    return Card(
      child: Container(
        padding: EdgeInsets.only(left: 20,right:20,top: 20,bottom: 20 ),
         alignment: Alignment.bottomCenter,
         child:Text('Documento de identiad',
         style: TextStyle(
           color: Color.fromRGBO(120, 132, 158, 1),
           fontSize: 16,
         ),)
      )
      
      
    );

  }

/*
  *@_titel3: Tercer titulo se encuentra en la parte inferior del pdf
*/
  Widget _titel3() {
      return Column(children: [

         Container(
           alignment: Alignment.bottomCenter,
           child: Text('Carga un documento en PDF que',
           style: TextStyle(
              color: Color.fromRGBO(120, 132, 158, 1),
               fontWeight: FontWeight.bold,
               fontSize: 13.0 )),
         ),
         Container(
            //margin: EdgeInsets.only(bottom:43),
           child: Text('contenga ambos lados del documento',
           style: TextStyle(
              color: Color.fromRGBO(120, 132, 158, 1),
               fontWeight: FontWeight.bold,
               fontSize: 13.0 )),
         ),
      ],);
  }

/*
  *@_checkBox1: terminos y condiciones
*/
 Widget _checkBox1() {
     return Row(
       children: [
         
          Checkbox(
             value: _check1,
             onChanged: (valor){
                   setState(() {
                     _check1 = valor;
                   });
             },
           ),
        
       
          Text('Acepto terminnos y condiciones',style: TextStyle(color: Color.fromRGBO(120, 132, 158, 1)),),
        
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
             onChanged: (valor){
                   setState(() {
                     _check2 = valor;
                   });
             },
           ),
        
       
          Text('Acepto tratamiento de datos personales',style: TextStyle(color: Color.fromRGBO(120, 132, 158, 1))),
        
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
       child:GestureDetector(
         onTap: snapshot.hasData ? ()=> _valores(bloc, context): null,
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
           )
       )        );

      },
   );
     
  }

  void _selectDate(BuildContext context) async{
     showDatePicker(
       context: context,
       initialDate: new   DateTime.now(),//hora actual
       firstDate:   new   DateTime(2018),//fecha de inicio
       lastDate:    new   DateTime(2025),//fecha fin
      locale:  Locale('es','ES')
    ).then((newDate){
        
    if ( newDate != null ){
      setState(() {
        _data =newDate;//le doy a fecha el volor que ingresen 
        _fecha = "${_data.year.toString().padLeft(2,'0')}-${_data.month.toString().padLeft(2,'0')}-${_data.day.toString().padLeft(2,'0')}";  
        _insetarFecha.text = _fecha;
      });
    }
    });
  }

 Widget _name(LoginBloc bloc) {


    return StreamBuilder(
      stream: bloc.nameStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) { 

              return  Container(
                 
                 padding: EdgeInsets.only(left: 10,right:10,top: 15 ),
                 child: TextFormField(
                        initialValue: "Yeferson monsalve",
                        style: textGreenDark4,
                        decoration: InputDecoration(
                        labelStyle: textBlack4.copyWith(color: greenDarkColor),
                        labelText: "Nombre",
                        errorText:snapshot.error),
                        onChanged: bloc.changeName,
          ),
               );
  },
    );
    
  }

 Widget _email(LoginBloc bloc) {
     return StreamBuilder(
        stream: bloc.emailStream,
         builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {

       return Container(
            padding: EdgeInsets.only(left: 10,right:10 ),
            child: TextFormField(
              initialValue: "yeferson8912@gmisl.com",
              style: textGreenDark4,
              decoration: InputDecoration(
                labelStyle: textBlack4.copyWith(color: greenDarkColor),
                labelText: "Correo Electronico",
                errorText: snapshot.error),
                onChanged: bloc.changeEmail,
            ),
          );

         }
     );



  }

 Widget _phone(LoginBloc bloc) {

return StreamBuilder(
        stream: bloc.phoneStream,
         builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {

            return  Container(
            padding: EdgeInsets.only(left: 10,right:10,bottom: 35 ),
            child: TextFormField(
              initialValue: "3157701640",
              style: textGreenDark4,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelStyle: textBlack4.copyWith(color: greenDarkColor),
                labelText: "Numero de Telefono",
                errorText: snapshot.error
              ),
                onChanged: bloc.changePhone,
              
            ),
          );

         }
     );

  }

 Widget _tipodocumento(LoginBloc bloc) {
    return Container(
            color: Colors.white,
            padding: EdgeInsets.only(left: 10,right:10,top: 15 ),
            child: SelectFormField(
                 labelText: 'Tipo de documento',
                 items: _items,
                 onChanged: (val) => print(val),
                 onSaved: (val) => print(val),
                 validator: ( String value ){
                                if (value.isEmpty) {
                                  return 'El tipo de documento es requerido';
                                }
                        },
                 ),
                        
                 
          );
  }

 Widget _noDocumento(LoginBloc bloc) {
    return StreamBuilder(
        stream: bloc.documentStream,
         builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {

            return  Container(
            padding: EdgeInsets.only(left: 10,right:10,bottom: 25),
            child: TextFormField(
              initialValue: "1090517661",
              style: textGreenDark4,
               keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelStyle: textBlack4.copyWith(color: greenDarkColor),
                labelText: "Numero de Documento",
                errorText: snapshot.error),
                onChanged: bloc.changeDocument,
            ),
          );

         }
     );
  }

Widget  _ciudad(LoginBloc bloc) {
      return StreamBuilder(
        stream: bloc.ciudadStream,
         builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {

            return  Container(
            padding: EdgeInsets.only(left: 10,right:10,top: 15 ),
            child: TextFormField(
              initialValue: "bogota",
              style: textGreenDark4,
              decoration: InputDecoration(
                labelStyle: textBlack4.copyWith(color: greenDarkColor),
                labelText: "Ciudad donde haras las entregas",
                errorText: snapshot.error),
                onChanged: bloc.changeCiudad,
               
            ),
            
          );

         }
     );
  }

 Widget _address(LoginBloc bloc) {
      return StreamBuilder(
        stream: bloc.addresStream,
         builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {

            return  Container(
               padding: EdgeInsets.only(left: 10,right:10 ),
               child: TextFormField(
                 initialValue: "av45 call36",
            style: textGreenDark4,
            decoration: InputDecoration(
                labelStyle: textBlack4.copyWith(color: greenDarkColor),
                labelText: "Direccion",
                errorText: snapshot.error ),
                onChanged: bloc.changeAddress,
                
          ),
             );

         }
     );
  }

  _valores(LoginBloc bloc, BuildContext context) {
   if(!_formkey.currentState.validate()){return;}
            _formkey.currentState.save();
    Navigator.pushReplacementNamed(context, "pendiente");

   print('======================='); 
   print('NOmbre: ${bloc.name}');        
   print('EMAIL: ${bloc.email}');        
   print('DOCUMENTO: ${bloc.document}');        
   print('CIUDAD: ${bloc.ciudad}');        
   print('DIRECCION: ${bloc.image}');        
   print('CELULAR: ${bloc.phone}');        
   print('=======================');  

   authProvider.formatoUser(bloc.name, bloc.document, bloc.email, bloc.phone );      

  }

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
                            SizedBox(width: 5,),
                            Text("Subien una foto".toUpperCase(), style: titleWhite5,
                            textAlign: TextAlign.center,),
                          ],
                        ),
                      ),
                    ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 20,top: 20),
              child: _mostrarFoto()
              ),
          ],
        ),
              );
  }




 Widget _mostrarFoto(){

     return Image(
             image: AssetImage( foto ?.path ??'assets/img/png/no-image.png'),
             height: 300.0,
             fit: BoxFit.cover,
     );
   
  }

   _seleccionarFoto() async {
    final _picker = ImagePicker();

    PickedFile _foto = await _picker.getImage(source: ImageSource.gallery);
    
    foto = _foto;
    if (_foto != null){
       
    }

    setState(() {
      
    });
  }

 

 
}
var foto;
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
final List<Map<String, dynamic>> _items= [
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