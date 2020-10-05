
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;
import '../utils/constants.dart';
import '../models/user.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
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

  Future<Map<String, dynamic>> loginUser(String email, String password) async { 
    final storage = new FlutterSecureStorage();

    print('lars- loginUser: email: ${email}');
    print('lars- loginUser: password: ${password}');

    final url = "https://bikeu.healtheworld.com.co/api/auth/login";
    try{
      var map = new Map<String, dynamic>();
      map['email'] = email;
      map['password'] =  password;



      
      http.Response response = await http.post(
              url,
              body: map,
);    

      var data = jsonDecode(response.body);
      await storage.write(key: 'access_token', value: data['access_token']);
      print('lars- loginUser: response: ${response.body}');
      print('lars- loginUser: response: ${data['access_token']}');
      
      var user = data['user'];
      String id   = user['id'].toString();
      print('Lars- id: ${id}');
      await storage.write(key: 'user_id', value: id);

      // final responseData = json.decode(response.body);
      // if(responseData['error'] != null){
      //   throw responseData['error']; 
      // }
      Map<String, dynamic> decodeResponse = json.decode(response.body);

  
      //print('lars- decodeResponse: ${decodeResponse}');

    if(decodeResponse.containsKey('access_token')){
      
      return {"ok": true};
    }else{
      return {"ok": false, "message": decodeResponse};
    }
    
    }catch(error){
      throw error;
    }
  }

}