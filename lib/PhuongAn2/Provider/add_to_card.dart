import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Models/product_models.dart';

class CartProvider extends ChangeNotifier {
  final List<Product> _cart = [];
  List<Product> get cart => _cart;

  void toggleFavorite(Product product) {
    final index = _cart.indexWhere((item) => item.image == product.image);
    if (index >= 0) {
      _cart.removeAt(index);
    } else {
      _cart.add(product);
    }
    notifyListeners(); // Báo cho các widget lắng nghe biết về sự thay đổi
  }

  static CartProvider of(BuildContext context, {bool listen = true}) {
    return Provider.of<CartProvider>(
      context,
      listen: listen,
    );
  }
}