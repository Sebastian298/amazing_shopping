import 'package:amazing_shopping/domain/entities/fake_store/product.dart';
import 'package:amazing_shopping/presentation/providers/fake_store/product_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final topProductsProvider =
    StateNotifierProvider<ProductNotifier, List<Product>>(
  (ref) {
    final loadProducts = ref.watch(productRepositoryProvider);
    return ProductNotifier(productCallback: loadProducts.getTop);
  },
);

typedef ProductCallback = Future<List<Product>> Function();

class ProductNotifier extends StateNotifier<List<Product>> {
  ProductCallback productCallback;

  ProductNotifier({required this.productCallback}) : super([]);

  Future<void> loadProducts() async {
    final List<Product> products = await productCallback();
    state = [...state, ...products];
  }
}
