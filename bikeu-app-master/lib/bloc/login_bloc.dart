import 'dart:async';

import 'package:bikeu/bloc/validator.dart';
import 'package:rxdart/rxdart.dart';

class LoginBloc with Validators {

 final _nameController     = BehaviorSubject<String>();
 final _documentController = BehaviorSubject<String>();
 final _emailtroller       = BehaviorSubject<String>();
 final _phoneController    = BehaviorSubject<String>();
 final _addressController  = BehaviorSubject<String>();
 final _ciudadController   = BehaviorSubject<String>();
 final _imageController    = BehaviorSubject<String>();


 Stream<String> get nameStream       => _nameController.stream.transform(validatorName);
 Stream<String> get documentStream   => _documentController.stream.transform(validatorDocument);
 Stream<String> get emailStream      => _emailtroller.stream.transform(validatorEmail) ;
 Stream<String> get phoneStream      => _phoneController.stream.transform(validatorPhone) ;
 Stream<String> get addresStream     => _addressController.stream.transform(validatorAddres);
 Stream<String> get ciudadStream      => _ciudadController.stream.transform(validatorCiudad);
 Stream<String> get imageStream       => _imageController.stream.transform(validatorImage);


Stream<bool> get validarForm =>
     Rx.combineLatest6(nameStream, documentStream, emailStream, phoneStream, ciudadStream, addresStream, (n, d, e, p, c, a) => true);

// Insertar valores al streams
 Function(String) get changeName     => _nameController.sink.add;
 Function(String) get changeDocument => _documentController.sink.add;
 Function(String) get changeEmail    => _emailtroller.sink.add;
 Function(String) get changePhone    => _phoneController.sink.add;
 Function(String) get changeAddress  => _addressController.sink.add;
 Function(String) get changeCiudad   => _ciudadController.sink.add;
 Function(String) get changeImage    => _imageController.sink.add;

//Obtener el ultimo valor ingresado a los stream
String get name      => _nameController.value;
String get document  => _documentController.value;
String get email     => _emailtroller.value;
String get phone     => _phoneController.value;
String get address   => _addressController.value;
String get ciudad    => _ciudadController.value;
String get image    => _imageController.value;




dispone(){
  _nameController?.close();
  _documentController?.close();
  _emailtroller?.close();
  _phoneController?.close();
  _addressController?.close();
  _ciudadController?.close();
  _imageController?.close();

}

}