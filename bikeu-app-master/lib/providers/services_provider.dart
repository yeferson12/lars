import 'package:flutter/material.dart';

class ServicesProvider extends ChangeNotifier {
  
  String _originAddress;
  String _destinationAddres;
  String _weight;
  String _volume;
  int _serviceType;


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