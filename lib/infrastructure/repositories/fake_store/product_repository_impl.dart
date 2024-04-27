import 'package:amazing_shopping/domain/datasources/fake_store/product_datasource.dart';
import 'package:amazing_shopping/domain/entities/fake_store/product.dart';
import 'package:amazing_shopping/domain/repositories/fake_store/product_repository.dart';

class ProductRepositoryImpl extends ProductRepository {
  final ProductDataSource productDataSource;

  ProductRepositoryImpl({required this.productDataSource});
  @override
  Future<List<Product>> getTop() {
    return productDataSource.getTop();
  }
}
