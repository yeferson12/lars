import 'package:flutter/material.dart';


class ServicesProvider extends ChangeNotifier {
  
  
  String _originAddress;
  String _destinationAddres;
  String _weight;
  String _titulo;
  String _text;
  String _volume;
  int _serviceType;
  String _observaciones;
  String _userId='yeferson';
  String _devicetoken='magollo';

  String get userId {
    return _userId;
  }
  
  set userId(value){
    _userId = value;
    notifyListeners();
  }
String get devicetoken {
    return _devicetoken;
  }
  
  set devicetoken(value){
    _devicetoken = value;
    notifyListeners();
  }

 










  String get text {
    return _text;
  }
  
  set text(value){
    _text = value;
    notifyListeners();
  }

  String get titulo {
    return _titulo;
  }
  
  set titulo(value){
    _titulo = value;
    notifyListeners();
  }

  String get observaciones {
    return _observaciones;
  }
  
  set observaciones(value){
    _observaciones = value;
    notifyListeners();
  }

  String get originAddress {
    return _originAddress;
  }

  set originAddress(value){
    _originAddress = value;
    notifyListeners();
  }

  set destinationAddres(value){
    _destinationAddres = value;
    notifyListeners();
  }
  
  String get destinationAddres {
    return _destinationAddres;
  }

  String get weight {
    return _weight;
  }

  set weight(value){
    _weight = value;
    notifyListeners();
  }

  String get volume {
    return _volume;
  }

  set volume(value){
    _volume = value;
    notifyListeners();
  }

  int get serviceType {
    return _serviceType;
  }

  set serviceType(value){
    _serviceType = value;
    notifyListeners();
  }



}