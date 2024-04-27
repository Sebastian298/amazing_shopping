class Product {
  final int id;
  final String title;
  final String description;
  final List<String> images;
  final double price;
  final DateTime creationAt;
  final DateTime updatedAt;
  bool isFavorite = false;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.images,
    required this.price,
    required this.creationAt,
    required this.updatedAt,
  });
}
