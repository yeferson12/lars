
import 'package:flutter/material.dart';

import '../models/company.dart';

class CompaniesProvider with ChangeNotifier{

  List<Company> _items = [
    Company(
      id: "1",
      name: "Mensajeros en bici Bogota",
      image: "https://png.pngtree.com/element_our/png_detail/20180823/bike-logo-design-template-vector-png_62379.jpg",
    ),
    Company(
      id: "2",
      name: "Mensajeros y mecanicos en bici",
      image: "https://cdn1.vectorstock.com/i/1000x1000/25/95/bicycle-bike-logo-vector-22962595.jpg",
    ),
    Company(
      id: "3",
      name: "Bicicleteros de Bogota",
      image: "https://i.pinimg.com/originals/2e/d1/15/2ed115c13891fd913afe5d2f32dfa85f.jpg",
    ),
  ];

  List<Company> get items {
    return [..._items];
  }

}