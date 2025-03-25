import 'package:flutter/material.dart';
import 'package:product_category/entities/product.dart';
import 'package:product_category/repositories/product_repository.dart';

class ProductService extends ChangeNotifier {
  final ProductRepository repository = ProductRepository();

  List<Product> get findAll => repository.findAll; 

  Product? findById(int id) {
    return repository.findById(id);
  }

  void create(Product obj) {
    repository.create(obj);
    notifyListeners();
  }

  void update(Product obj) {
    repository.update(obj);
    notifyListeners();
  }

  void delete(int id) {
    repository.delete(id);
    notifyListeners();
  }
}