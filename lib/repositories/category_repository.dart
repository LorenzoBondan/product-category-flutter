import 'package:product_category/entities/category.dart';

class CategoryRepository {
  final List<Category> list = [
    Category(id: 1, name: "Eletrônicos"),
    Category(id: 2, name: "Acessórios"),
  ];

  List<Category> get findAll => list;

  Category? findById(int id) {
    return list.firstWhere((obj) => obj.id == id, orElse: () => Category(id: 0, name: ''));
  }

  void create(Category obj) {
    final newId = list.isNotEmpty ? list.last.id + 1 : 1;
    list.add(Category(id: newId, name: obj.name));
  }

  void update(Category obj) {
    final index = list.indexWhere((p) => p.id == obj.id);
    if (index != -1) {
      list[index] = obj;
    }
  }

  void delete(int id) {
    list.removeWhere((p) => p.id == id);
  }
}