import 'package:bikeu/utils/constants.dart';
import 'package:flutter/material.dart';

class Pendiente extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: SafeArea(
         child: SingleChildScrollView(
           child: Container(
             child: Column(
               children: <Widget>[
                      Stack(
                        children: [
                          Container(
                        height: MediaQuery.of(context).size.height * 0.35,
                        decoration: BoxDecoration(
                        color: blueDrakColor,
                        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(36),bottomRight: Radius.circular(36))
                      ),
                    ),
                    Row(
                      children: [
                        
                        IconButton(
                          padding:EdgeInsets.only(top:25,left: 10),
                          icon : Icon(Icons.arrow_back,color: Colors.white),
                          onPressed: ()
                           {
                            Navigator.pop(context);
                           },
                        ),
                        
                        Expanded(child:SizedBox(width:5.0)),
                        Container(
                          padding:EdgeInsets.only(top:25,right: 10),
                          child: Positioned(
                                  child: Container(
                                  width: 100,
                                  height: 40,
                                  child: Image(
                                  image: AssetImage("assets/img/png/logo-2.png"),
                        ),
                        )
                      ),
                    ),
                      ],
                        
                    ),
                    Positioned(
                      child: Container(
                        margin: EdgeInsets.only(
                          left: 20,
                          right: 20,
                          top: MediaQuery.of(context).size.height * 0.16,
                          bottom: MediaQuery.of(context).size.height * 0.16
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: 30,
                          vertical: MediaQuery.of(context).size.height * 0.08
                        ),
                        decoration: BoxDecoration(
                          color: whiteColor,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.10),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: Offset(0, 10),
                            )
                          ],
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Column(

                          children: [
                            Center(
                              child: Text('Tu solicitud de registro se encuentra:',
                              
                              style: TextStyle(color: Colors.black54,
                              fontSize:16)),
                            ),
                           SizedBox(
                        height: MediaQuery.of(context).size.height * 0.050,
                      ),
                            Container(
                              decoration: BoxDecoration(
                          color: whiteColor,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.10),
                              spreadRadius: 3,
                              blurRadius: 6,
                              offset: Offset(1, 5),
                            )
                          ],
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        padding: EdgeInsets.symmetric(vertical: 20),
                        width: 280,
                        child: Center(
                            child: Text(
                          "PENDIENTE",
                          style: TextStyle(
                            fontSize: 20,
                            color: Color.fromRGBO(0, 191, 242, 1),
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                      ),
                           SizedBox(
                        height: MediaQuery.of(context).size.height * 0.050,
                      ),
                      Center(
                              child: Text('Gracias por tu espera, pronto',
                              style: TextStyle(color: Colors.black54,
                              fontSize:16)),
                            ),
                      Center(
                              child: Text('tu estado sera actualizado...',
                              style: TextStyle(color: Colors.black54,
                              fontSize:16),
                              textAlign: TextAlign.left),
                            ),      
                          ],
                        ),
                      ),
                    ),
                    
                        ],
                      ),
                       
               ],
             ),
           ),
         ),
       ),
    );
  }
}