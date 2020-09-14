import 'package:bikeu/utils/constants.dart';
import 'package:flutter/material.dart';

class PasswordRecovery extends StatefulWidget {
  @override
  _PasswordRecoveryState createState() => _PasswordRecoveryState();
}

class _PasswordRecoveryState extends State<PasswordRecovery> {
  
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
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
                    image: AssetImage("assets/img/png/logo-1.png"),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.15),
                Container(
                  child: TextField(
                    controller: email,
                    decoration: InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: blueDrakColor, width: 2.0),
                          //borderRadius: BorderRadius.circular(25.7),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: blueDrakColor.withOpacity(0.36),
                              width: 2.0),
                          //borderRadius: BorderRadius.circular(25.7),
                        ),
                        hintText: "Correo",
                        hintStyle: TextStyle(
                          color: blueDrakColor.withOpacity(0.56),
                        )),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.04,
                ),
                // Container(
                //   child: TextField(
                //     controller: password,
                //     decoration: InputDecoration(
                //         focusedBorder: UnderlineInputBorder(
                //           borderSide:
                //               BorderSide(color: colorPrimary, width: 2.0),
                //           //borderRadius: BorderRadius.circular(25.7),
                //         ),
                //         enabledBorder: UnderlineInputBorder(
                //           borderSide: BorderSide(
                //               color: colorPrimary.withOpacity(0.36),
                //               width: 2.0),
                //           //borderRadius: BorderRadius.circular(25.7),
                //         ),
                //         hintText: "Contraseña",
                //         hintStyle: TextStyle(
                //           color: colorPrimary.withOpacity(0.56),
                //         )),
                //   ),
                // ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                ),
                Container(
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        flex: 3,
                        child: Text(
                          "Enviar email de recuperación",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1
                              .copyWith(fontSize: 15),
                        ),
                      ),
                      Container(
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
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomSheet: Container(
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            GestureDetector(
              onTap: () {
                Navigator.pushReplacementNamed(context, "register");
              },
              child: Text(
                "¿No tienes una cuenta? Crea una.",
                style: TextStyle(
                    fontSize: 12,
                    color: Color.fromRGBO(120, 132, 158, 1),
                    decoration: TextDecoration.underline),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacementNamed(context, "login");
              },
              child: Text(
                "Inicia sesión",
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
  
}