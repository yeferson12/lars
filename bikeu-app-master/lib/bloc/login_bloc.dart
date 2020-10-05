import 'dart:async';

import 'package:bikeu/bloc/validator.dart';
import 'package:rxdart/rxdart.dart';

class LoginBloc with Validators {

 final _nameController         = BehaviorSubject<String>();
 final _documentController     = BehaviorSubject<String>();
 final _emailtroller           = BehaviorSubject<String>();
 final _phoneController        = BehaviorSubject<String>();
 final _addressController      = BehaviorSubject<String>();
 final _ciudadController       = BehaviorSubject<String>();
 final _imageController        = BehaviorSubject<String>();
 final _origuenController      = BehaviorSubject<String>();
 final _destinoController      = BehaviorSubject<String>();
 final _emailLoguinController  = BehaviorSubject<String>();
 final _passwordController     = BehaviorSubject<String>();
 final _tipoDniController      = BehaviorSubject<String>();
 final _modoTrasporteController= BehaviorSubject<String>();


 Stream<String> get nameStream             => _nameController.stream.transform(validatorName);
 Stream<String> get documentStream         => _documentController.stream.transform(validatorDocument);
 Stream<String> get emailStream            => _emailtroller.stream.transform(validatorEmail) ;
 Stream<String> get phoneStream            => _phoneController.stream.transform(validatorPhone) ;
 Stream<String> get addresStream           => _addressController.stream.transform(validatorAddres);
 Stream<String> get ciudadStream           => _ciudadController.stream.transform(validatorCiudad);
 Stream<String> get imageStream            => _imageController.stream.transform(validatorImage);
 Stream<String> get emailLoguinStream      => _emailLoguinController.stream.transform(validatorEmailLogin);
 Stream<String> get passwordStream         => _passwordController.stream.transform(validatorpassword);
 Stream<String> get tipoDniStream          => _tipoDniController.stream;
 Stream<String> get modoTrasporteStream    => _modoTrasporteController.stream;


Stream<bool> get validarForm =>
     Rx.combineLatest6(nameStream, documentStream, emailStream, phoneStream, ciudadStream, addresStream, (n, d, e, p, c, a) => true);

Stream<bool> get validarLoguin =>
     Rx.combineLatest2(emailLoguinStream, passwordStream, (e, p) => true);


// Insertar valores al streams
 Function(String) get changeName         => _nameController.sink.add;
 Function(String) get changeDocument     => _documentController.sink.add;
 Function(String) get changeEmail        => _emailtroller.sink.add;
 Function(String) get changePhone        => _phoneController.sink.add;
 Function(String) get changeAddress      => _addressController.sink.add;
 Function(String) get changeCiudad       => _ciudadController.sink.add;
 Function(String) get changeImage        => _imageController.sink.add;
 Function(String) get changeOriguen      => _origuenController.sink.add;
 Function(String) get changeDestino      => _destinoController.sink.add;
 Function(String) get changePassword     => _passwordController.sink.add;
 Function(String) get changeEmailLoguin  => _emailLoguinController.sink.add;
 Function(String) get changeTipoDni      => _tipoDniController.sink.add;
 Function(String) get changemodoTrasporte  => _modoTrasporteController.sink.add;

//Obtener el ultimo valor ingresado a los stream
String get name         => _nameController.value;
String get document     => _documentController.value;
String get email        => _emailtroller.value;
String get phone        => _phoneController.value;
String get address      => _addressController.value;
String get ciudad       => _ciudadController.value;
String get image        => _imageController.value;
String get origuen      => _origuenController.value;
String get destino      => _destinoController.value;
String get emailLoguin  => _emailLoguinController.value;
String get password     => _passwordController.value;
String get tipoDni      => _tipoDniController.value;
String get modoTrasporte   => _modoTrasporteController.value;




dispone(){
  _nameController?.close();
  _documentController?.close();
  _emailtroller?.close();
  _phoneController?.close();
  _addressController?.close();
  _ciudadController?.close();
  _imageController?.close();
  _origuenController?.close();
  _destinoController?.close();
  _passwordController?.close();
  _emailLoguinController?.close();
  _tipoDniController?.close();
  _modoTrasporteController?.close();

}

}