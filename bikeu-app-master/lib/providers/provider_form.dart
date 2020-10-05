import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:path/path.dart';

import 'dart:io';
import '../utils/constants.dart';

class FormProvider extends ChangeNotifier{

   formatoUser(String name, String dni, String email, String phone,String address, String city, File _imagen, String tipoDni, ) async {
     final url = 'http://api.quisoft.com.co/public/api/formapp';
    
        print('=======================');
     print('name: ${name}');
     print('email: ${email}');
     print('dni: ${dni}');
     print('address: ${address}');
     print('city: ${city}');
     print('_imagen: ${_imagen}');
     print('phone: ${phone}');
     print('dni_type: ${tipoDni}');
     print('=======================');
     final url1 = apiUrl+'//formapp';
    try{
      var postUri = Uri.parse(url);
      var request = new http.MultipartRequest("POST", postUri);
      //headers
      request.headers['Content-type'] = 'application/json';
      request.headers['Accept'] = 'application/json';
      //request.headers['Authorization'] = 'Bearer ${ _preferences.token }';
      //campos
      request.fields['name']     =  name;
      request.fields['email']    =  email;
      request.fields['phone']    = phone;
      request.fields['city']     = city;
      request.fields['address']  = address;
      request.fields['dni']      = dni;
      request.fields['dni_type'] = tipoDni;
      //imagenes
     
        request.files.add(new http.MultipartFile.fromBytes('image', await File.fromUri(Uri.parse(_imagen.path)).readAsBytes(), filename: basename(_imagen.path), contentType: new MediaType('image', 'jpeg')));
     
      
      final response = await request.send();
      if (response.statusCode == 200){
        print('response.request -->  ${response.request}');
        print(response.statusCode);
        print(response.toString());
        print(response.headers);
        print(response.stream.toString());
        print('response.request -->  ${response.reasonPhrase}');
        print("Uploaded!");
      
    }else
    {
      print("fallo");
    }   
    }catch(error){
      print(error);
      throw error;
    } 
 
 }
}