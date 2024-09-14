import 'package:dummycommerce/model/product_model.dart';
import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  //initial list of cart items and their quantity
  final Map<Product, int> _cartItems = {};

  //getter
  Map<Product, int> get cartItems => _cartItems;

  //method to add items to cart
  void addItemToCart(Product product) {
    _cartItems[product] = 1;
    notifyListeners();
  }

  //method to remove item from cart
  void removeItemFromCart(Product product) {
    _cartItems.remove(product);
    notifyListeners();
  }

  //increment the product counter
  void incrementCounter(Product product) {
    if (_cartItems.containsKey(product)) {
      _cartItems[product] = _cartItems[product]! + 1;
      notifyListeners();
    }
  }

//decrement the product counter
  void decrementCounter(Product product) {
    if (_cartItems.containsKey(product) && _cartItems[product]! > 1) {
      _cartItems[product] = _cartItems[product]! - 1;
      notifyListeners();
    }
  }
}
