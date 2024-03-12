import 'package:amazing_shopping/domain/entities/fake_store/product.dart';

abstract class ProductRepository {
  Future<List<Product>> getTop();
}
