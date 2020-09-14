
import 'package:bikeu/bloc/login_bloc.dart';
export 'package:bikeu/bloc/login_bloc.dart';
import 'package:flutter/material.dart';

class Providerr extends InheritedWidget{

  final loginBloc = LoginBloc();

  Providerr({Key key, Widget child})
    : super(key: key, child:child);



  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;



  static  LoginBloc of (BuildContext context){
    return context.dependOnInheritedWidgetOfExactType<Providerr>().loginBloc;
  }
}