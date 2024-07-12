import "package:flutter/material.dart";
import "product.dart";

class Promo extends ChangeNotifier {
  final List<Product> _promo = [];

  final List<Product> _cart = [];

  List<Product> get promo => _promo;

  List<Product> get cart => _cart;

  

  //aumentar a quantidade de produto no carrinho
  void incrementQuantity(Product item) {
    _cart.firstWhere((cartItem) => cartItem == item).incrementQuantity();
    notifyListeners();
  }

  //diminuir a quantidade de produto no carrinho
  void decreamentQuantity(Product item) {
    _cart.firstWhere((cartItem) => cartItem == item).decreamentQuantity();
        notifyListeners();

  }

  //zerar quantidade de produto no carrinho 
  void initialQuantity(Product item) {
    _cart.firstWhere((cartItem) => cartItem == item).initialQuantity();
    notifyListeners();
  }

  void addToCart(Product item) {
   if(_cart.contains(item)){
    incrementQuantity(item);
    notifyListeners();
   }else {
    _cart.add(item);
    incrementQuantity(item);
    notifyListeners();
   }
  }
  //remover do carrinho
  void removeFromCart(Product item) {
    initialQuantity(item);
    _cart.remove(item);
    notifyListeners();
  }
 //diminuir quantidade de produto no carrinho
  void decreamentFromCart(Product item) {
    decreamentQuantity(item);
    notifyListeners();
  }
}
