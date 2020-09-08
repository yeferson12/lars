import 'package:flutter/material.dart';

import 'package:bikeu/utils/constants.dart';


class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  TextEditingController name = TextEditingController(),
  email = TextEditingController(),
  password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Container(
                      height: MediaQuery.of(context).size.height * 0.35,
                      decoration: BoxDecoration(
                        color: blueDrakColor,
                        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(36),bottomRight: Radius.circular(36))
                      ),
                    ),
                    Positioned(
                      top: 30,
                      left: 20,
                      child: Container(
                        width: 100,
                        height: 40,
                        child: Image(
                          image: AssetImage("assets/img/png/logo-2.png"),
                        ),
                      ),
                    ),
                    Positioned(
                      child: Container(
                        margin: EdgeInsets.only(
                          left: 20,
                          right: 20,
                          top: MediaQuery.of(context).size.height * 0.14
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: 30,
                          vertical: MediaQuery.of(context).size.height * 0.05
                        ),
                        decoration: BoxDecoration(
                          color: whiteColor,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: Offset(0, 10), // changes position of shadow
                            ),
                          ],
                          borderRadius: BorderRadius.circular(10.0)),
                        child: Column(
                          children: <Widget>[
                            Container(
                              child: TextField(
                                controller: name,
                                style: TextStyle(fontSize: 12),
                                decoration: InputDecoration(
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: blueDrakColor),
                                      //borderRadius: BorderRadius.circular(25.7),
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color:
                                              Color.fromRGBO(221, 221, 221, 1)),
                                      //borderRadius: BorderRadius.circular(25.7),
                                    ),
                                    hintText: "Nombre",
                                    hintStyle: TextStyle(
                                        color:
                                            Color.fromRGBO(125, 191, 209, 0.8),
                                        fontSize: 12)),
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.01,
                            ),
                            Container(
                              child: TextField(
                                controller: email,
                                style: TextStyle(fontSize: 12),
                                decoration: InputDecoration(
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: blueDrakColor),
                                      //borderRadius: BorderRadius.circular(25.7),
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color:
                                              Color.fromRGBO(221, 221, 221, 1)),
                                      //borderRadius: BorderRadius.circular(25.7),
                                    ),
                                    hintText: "Email",
                                    hintStyle: TextStyle(
                                        color:
                                            Color.fromRGBO(125, 191, 209, 0.8),
                                        fontSize: 12)),
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.01,
                            ),
                            Container(
                              child: TextField(
                                controller: password,
                                obscureText: true,
                                style: TextStyle(fontSize: 12),
                                decoration: InputDecoration(
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: blueDrakColor),
                                      //borderRadius: BorderRadius.circular(25.7),
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color:
                                              Color.fromRGBO(221, 221, 221, 1)),
                                      //borderRadius: BorderRadius.circular(25.7),
                                    ),
                                    hintText: "Contraseña",
                                    hintStyle: TextStyle(
                                        color:
                                            Color.fromRGBO(125, 191, 209, 0.8),
                                        fontSize: 12)),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.035,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 20),
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(0, 191, 242, 1),
                            borderRadius: BorderRadius.circular(50)),
                        child: Center(
                            child: Text(
                          "REGÍSTRATE",
                          style: TextStyle(
                            fontSize: 12,
                            color: whiteColor,
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.03,
                      ),
                      Text(
                        "CONTINUA CON:",
                        style: TextStyle(fontSize: 12),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.01,
                      ),
                      Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(vertical: 10),
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(59, 89, 153, 1),
                            borderRadius: BorderRadius.circular(50)),
                        child: Row(
                          children: <Widget>[
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.2,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.07,
                              child: Image(
                                image: AssetImage("assets/img/png/facebook.png"),
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.03,
                            ),
                            Text(
                              "Regístrate con Facebook",
                              style: TextStyle(
                                fontSize: 12,
                                color: whiteColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.01,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(81, 142, 248, 1),
                            borderRadius: BorderRadius.circular(50)),
                        child: Row(
                          children: <Widget>[
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.2,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.07,
                              child: Image(
                                image: AssetImage("assets/img/png/google.png"),
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.03,
                            ),
                            Text(
                              "Regístrate con Google",
                              style: TextStyle(
                                fontSize: 12,
                                color: whiteColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.03,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacementNamed(context, "login");
                        },
                        child: Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Ya tienes una cuenta, Inicia Sesión",
                            style: TextStyle(
                                fontSize: 12,
                                color: Color.fromRGBO(120, 132, 158, 1),
                                decoration: TextDecoration.underline),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}