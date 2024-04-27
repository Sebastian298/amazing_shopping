import 'package:amazing_shopping/infrastructure/mappers/fake_store/product_mapper.dart';
import 'package:amazing_shopping/infrastructure/models/fake_store/product_response.dart';
import 'package:dio/dio.dart';
import 'package:amazing_shopping/domain/datasources/fake_store/product_datasource.dart';
import 'package:amazing_shopping/domain/entities/fake_store/product.dart';

class ProductDatasourceImpl extends ProductDataSource {
  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://fakestoreapi.com/products',
      headers: {
        'Content-Type': 'application/json',
      },
    ),
  );

  @override
  Future<List<Product>> getTop() async {
    final response = await dio.get('?limit=5');
    final dynamicListProducts = response.data as List;
    final products = dynamicListProducts
        .map(
          (dynamic product) => ProductMapper.productToEntity(
            ProductResponse.fromJson(product),
          ),
        )
        .toList();
    return products;
  }
}
