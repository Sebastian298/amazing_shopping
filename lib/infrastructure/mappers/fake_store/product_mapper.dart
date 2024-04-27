import 'package:amazing_shopping/domain/entities/fake_store/product.dart';
import 'package:amazing_shopping/infrastructure/models/fake_store/product_response.dart';

class ProductMapper {
  static Product productToEntity(ProductResponse product) {
    return Product(
      id: product.id,
      title: product.title,
      price: double.parse(product.price.toString()),
      description: product.description,
      images: product.images,
      creationAt: product.creationAt,
      updatedAt: product.updatedAt,
      // category: CategoryMapper.categoryToEntity(product.category),
    );
  }
}
