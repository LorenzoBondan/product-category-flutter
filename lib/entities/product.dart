class Product {
  final int id;
  final String name;
  final int categoryId;
  final bool isDisponible;

  Product({required this.id, required this.name, required this.categoryId, this.isDisponible = true});
}