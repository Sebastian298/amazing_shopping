import 'package:amazing_shopping/domain/entities/fake_store/product.dart';

abstract class ProductDataSource {
  Future<List<Product>> getTop();
}
