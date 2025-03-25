import 'package:flutter/material.dart';
import 'package:product_category/entities/category.dart';
import 'package:product_category/repositories/category_repository.dart';

class CategoryService extends ChangeNotifier {
  final CategoryRepository repository = CategoryRepository();

  List<Category> get findAll => repository.findAll; 

  Category? findById(int id) {
    return repository.findById(id);
  }

  void create(Category obj) {
    repository.create(obj);
    notifyListeners();
  }

  void update(Category obj) {
    repository.update(obj);
    notifyListeners();
  }

  void delete(int id) {
    repository.delete(id);
    notifyListeners();
  }
}