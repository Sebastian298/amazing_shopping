import 'package:amazing_shopping/infrastructure/datasources/fake_store/product_datasource_impl.dart';
import 'package:amazing_shopping/infrastructure/repositories/fake_store/product_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final productRepositoryProvider = Provider<ProductRepositoryImpl>((ref) {
  return ProductRepositoryImpl(
    productDataSource: ProductDatasourceImpl(),
  );
});
