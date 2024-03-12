class Product {
  final int id;
  final String title;
  final String description;
  final List<String> images;
  final double price;
  bool isFavorite = false;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.images,
    required this.price,
    required this.isFavorite,
  });
}
