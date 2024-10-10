import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './model/product.dart';
import './model/products_repository.dart';
import 'app.dart';

class MyAppState extends ChangeNotifier {
  List<Product> products = ProductsRepository.loadProducts();
  var favorites = <Product>[];

  void toggleFavorite(Product product) {
    if (favorites.contains(product)) {
      favorites.remove(product);
    } else {
      favorites.add(product);
    }
    notifyListeners();
  }

  bool isFavorite(Product product) {
    return favorites.contains(product);
  }

  void removeFavorite(Product product) {
    favorites.remove(product);
    notifyListeners();
  }
}

void main() => runApp(
      ChangeNotifierProvider(
        create: (context) => MyAppState(),
        child: const ShrineApp(),
      ),
    );
