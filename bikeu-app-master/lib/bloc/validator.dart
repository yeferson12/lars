

import 'dart:async';

import 'dart:ffi';

class Validators {

  final validatorEmailLogin = StreamTransformer<String, String>.fromHandlers(
    handleData:(emailLogin, sink){
       Pattern pattern=  r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?";
     RegExp regExp = new RegExp(pattern);

     if(regExp.hasMatch(emailLogin)&& emailLogin.length >=1){
       sink.add(emailLogin);
     }else{
       sink.addError('El correo electronico es requerido');
     }
    }
  );
  
  final validatorpassword = StreamTransformer<String, String>.fromHandlers(
    handleData:(password, sink){
      if(password.length >= 4){
          sink.add(password);
      }else{
        sink.addError('mas de 4 caracteres por favor');
      }
    }
  );

  final validatorImage = StreamTransformer<String, String>.fromHandlers(
    handleData:(email, sink){
    }
  );

  final validatorEmail = StreamTransformer<String, String>.fromHandlers(
    handleData:(email, sink){

     Pattern pattern=  r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?";
     RegExp regExp = new RegExp(pattern);

     if(regExp.hasMatch(email)&& email.length >=1){
       sink.add(email);
     }else{
       sink.addError('El correo electronico es requerido');
     }
    }
  );


  final validatorName = StreamTransformer<String, String>.fromHandlers(
    handleData:(name, sink){

     if(name.length >=1){
       sink.add(name);
     } else{
       sink.addError('El nombre es requerido');
     }
    }
  );
    
  final validatorPhone = StreamTransformer<String, String>.fromHandlers(
    handleData:(phone, sink){

     if(phone.length >=10){
       sink.add(phone);
     } else{
       sink.addError('Debe ser un numero de telefono');
     }
    }
  );

  final validatorDocument = StreamTransformer<String, String>.fromHandlers(
    handleData:(document, sink){

     if(document.length >=10){
       sink.add(document);
     } else{
       sink.addError('No es un numero valido');
     }
    }
  );

  final validatorCiudad = StreamTransformer<String, String>.fromHandlers(
    handleData:(ciuedad, sink){

     if(ciuedad.length >=1){
       sink.add(ciuedad);
     } else{
       sink.addError('La ciudad es requeridad');
     }
    }
  );

  final validatorAddres = StreamTransformer<String, String>.fromHandlers(
    handleData:(addres, sink){

     if(addres.length >=1){
       sink.add(addres);
     } else{
       sink.addError('La direccion es requeridad');
     }
    }
  );

  


}