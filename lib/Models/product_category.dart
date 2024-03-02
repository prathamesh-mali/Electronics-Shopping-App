import 'package:flutter/material.dart' show IconData;
import 'package:elec_ecom_app/Models/product.dart';

class ProductCategory {
  ProductType type;
  bool isSelected;
  IconData icon;

  ProductCategory(this.type, this.isSelected, this.icon);
}
