import 'package:product_category/entities/product.dart';

class ProductRepository {
  final List<Product> list = [
    Product(id: 1, name: "Smartphone", categoryId: 1, isDisponible: true),
    Product(id: 2, name: "Notebook", categoryId: 1, isDisponible: true),
    Product(id: 3, name: "Fone de Ouvido", categoryId: 2, isDisponible: false),
  ];

  List<Product> get findAll => list;

  Product? findById(int id) {
    return list.firstWhere((obj) => obj.id == id, orElse: () => Product(id: 0, name: '', categoryId: 0, isDisponible: false));
  }

  void create(Product obj) {
    final newId = list.isNotEmpty ? list.last.id + 1 : 1;
    list.add(Product(id: newId, name: obj.name, categoryId: obj.categoryId, isDisponible: obj.isDisponible));
  }

  void update(Product obj) {
    final index = list.indexWhere((p) => p.id == obj.id);
    if (index != -1) {
      list[index] = obj;
    }
  }

  void delete(int id) {
    list.removeWhere((p) => p.id == id);
  }
}