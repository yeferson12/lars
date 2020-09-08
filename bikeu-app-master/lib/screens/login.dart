import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../utils/constants.dart';
import 'package:http/http.dart' as http;
import 'dart:core';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  
  TextEditingController email = TextEditingController();

  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: GestureDetector(
            onTap: () {
              FocusScopeNode currentFocus = FocusScope.of(context);

              if (!currentFocus.hasPrimaryFocus) {
                currentFocus.unfocus();
              }
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                  Container(
                    width: 100,
                    height: 40,
                    child: Image(
                      image: AssetImage("assets/img/png/logo-3.png"),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.1,
                  ),
                  Container(
                    child: TextField(
                      keyboardType: TextInputType.emailAddress,
                      controller: email,
                      decoration: InputDecoration(
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: blueDrakColor),
                            //borderRadius: BorderRadius.circular(25.7),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromRGBO(221, 221, 221, 1)),
                            //borderRadius: BorderRadius.circular(25.7),
                          ),
                          hintText: "Correo",
                          hintStyle: TextStyle(
                              color: Color.fromRGBO(125, 191, 209, 0.8))),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  Container(
                    child: TextField(
                      obscureText: true,
                      controller: password,
                      decoration: InputDecoration(
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: blueDrakColor),
                            //borderRadius: BorderRadius.circular(25.7),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromRGBO(221, 221, 221, 1)),
                            //borderRadius: BorderRadius.circular(25.7),
                          ),
                          hintText: "Contraseña",
                          hintStyle: TextStyle(
                              color: Color.fromRGBO(125, 191, 209, 0.8))),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  Container(
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          flex: 3,
                          child: Text(
                            "Iniciar Sesión",
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                        ),
                        GestureDetector(
                          //onTap: login,
                          onTap: (){
                            Navigator.of(context).pushReplacementNamed("home");
                          },
                          child: Container(
                            padding: EdgeInsets.all(15),
                            decoration: BoxDecoration(
                                color: blueDrakColor,
                                borderRadius: BorderRadius.circular(50)),
                            child: Icon(
                              Icons.arrow_forward,
                              color: whiteColor,
                              size: 25,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  Container(
                    child: Row(
                      children: <Widget>[
                        Text(
                          "Iniciar Sesión con",
                          style: TextStyle(
                              color: blueDrakColor,
                              fontSize: 18,
                              fontWeight: FontWeight.normal),
                        ),
                        SizedBox(
                          width: 40,
                        ),
                        Container(
                          width: 40,
                          child:Image(
                            image: AssetImage("assets/img/png/facebook.png"),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 20),
                          width: 38,
                          child: Image(
                            image: AssetImage("assets/img/png/google.png"),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomSheet: Container(
        margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            GestureDetector(
              onTap: () {
                Navigator.pushReplacementNamed(context, "register");
              },
              child: Text(
                "Crear una cuenta",
                style: TextStyle(
                    fontSize: 12,
                    color: Color.fromRGBO(120, 132, 158, 1),
                    decoration: TextDecoration.underline),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacementNamed(context, "passwordRecovery");
              },
              child: Text(
                "¿Recordar la contraseña?",
                style: TextStyle(
                    fontSize: 12,
                    color: Color.fromRGBO(120, 132, 158, 1),
                    decoration: TextDecoration.underline),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void login() async {
    Navigator.of(context).pushNamed("home");
    /*
    FocusScopeNode currentFocus = FocusScope.of(context);
  
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
    if (EmailValidator.validate(email.text) && password.text.toString() != "") {
      try {
        print(email.text + password.text);
        var res = await http.post(
          apiUrl + "/api/auth/login",
          headers: <String, String>{
            'Content-Type': 'application/json',
          },
          body: jsonEncode(
              <String, String>{'email': email.text, 'password': password.text}),
        );
        print(json.decode(res.body));
        Map response = jsonDecode(res.body);
        if (response["response"]["access_token"] != null) {
          print(response["response"]["access_token"]);
          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setString('api_token', response["response"]["access_token"]);
          Navigator.pushReplacementNamed(context, "homeMap");
        } else {
          Fluttertoast.showToast(
              msg: response["response"]["message"],
              toastLength: Toast.LENGTH_SHORT,
              backgroundColor: colorPrimary,
              textColor: Colors.white);
        }
      } catch (e) {
        print(e);
        Fluttertoast.showToast(
            msg: "error al logear",
            toastLength: Toast.LENGTH_SHORT,
            backgroundColor: colorPrimary,
            textColor: Colors.white);
      }
    } else {
      Fluttertoast.showToast(
          msg: "ingresa un email valido y contraseña",
          toastLength: Toast.LENGTH_SHORT,
          backgroundColor: colorPrimary,
          textColor: Colors.white);
    }
    */
  }
  
}
