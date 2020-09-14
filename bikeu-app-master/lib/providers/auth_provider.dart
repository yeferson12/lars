
import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;

import '../utils/constants.dart';
import '../models/user.dart';

class AuthProvider extends ChangeNotifier{

  Future<void> registerUser(User user) async {
    final url = apiUrl+"/users";
    try{
      final response = await http.post(url, body: json.encode({
          "name": user.name,
          "last_name": user.lastName,
          "email": user.email,
          "password": user.password,
          "phone": user.phone
        }),
      );
      notifyListeners();
    }catch(error){
      print(error);
      throw error;
    }
  }

  Future<void> loginUser(String email, String password) async {
    final url = apiUrl+"/login";
    try{
      final response = await http.post(url, body: json.encode({
        'email': email, 
        'password': password, 
      }));
      final responseData = json.decode(response.body);
      if(responseData['error'] != null){
        throw responseData['error'];
      }
      Map<String, dynamic> decodeResponse = json.decode(response.body);
    if(decodeResponse.containsKey('access_token')){
      // _preferences.laravelToken = decodeResponse['access_token'];
      // _preferences.email = decodeResponse['user']['email'];
      // _preferences.name = decodeResponse['user']['name'];
      // _preferences.image = decodeResponse['user']['image'];
      // _preferences.userType = decodeResponse['user']['user_types_id'];
      return {"ok": true};
    }else{
      return {"ok": false, "message": decodeResponse};
    }
    }catch(error){
      throw error;
    }
  }
  
  Future<void> formatoUser(String name, String dni, String email, String image, String phone) async {
     final url = apiUrl+"/formapp";
     try{
      final response = await http.post(url, body: json.encode({
          "name"    : name,
          "dni"     : dni,
          "email"   : email,
          "image"   : image,
          "phone"   : phone,
        }),
      );
       print(response);
       
      notifyListeners();
    }catch(error){
      print(error);
      throw error;
    }
  }

   
}