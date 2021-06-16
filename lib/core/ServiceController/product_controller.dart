import 'package:flutter/material.dart';
import 'package:shopex/core/ApiServies/get_services.dart';
import 'package:shopex/core/Model/product_model.dart';

enum ProductLoadStatus { completed, searching, empty }

class FeatchProduct extends ChangeNotifier {
  List<ProductModel> product = [];
  ProductLoadStatus loadStatus = ProductLoadStatus.searching;
  notifyListeners();
  Future<void> getProduct() async {
    this.loadStatus = ProductLoadStatus.searching;
    var pageList = await ApiServies().getProduct();
    if (pageList != null) {
      if (product.isNotEmpty) {
        product.clear();
      }
      pageList.map((e) => product.add(e)).toList();
      this.loadStatus = ProductLoadStatus.completed;
      notifyListeners();
    } else {
      this.loadStatus = ProductLoadStatus.empty;
      notifyListeners();
    }
  }
}
