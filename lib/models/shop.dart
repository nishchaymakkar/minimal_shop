import 'package:flutter/cupertino.dart';
import 'package:minimal_shop/models/product.dart';

class Shop extends ChangeNotifier{
  //products for sale
  final List<Product> _shop = [
    Product(
        name: 'Black Hoodie',
        description: '',
        price: 700,
        imagePath: 'lib/assets/blackhoddie.jpg'
    ),
    Product(
        name: 'Black Glasses',
        description: '',
        price: 400,
        imagePath: 'lib/assets/blackglasses.jpg'),
    Product(
        name: 'Black Sneakers',
        description: '',
        price: 2000,
        imagePath: 'lib/assets/blackshoe.jpg'
    ),
    Product(
        name: 'Black Smart Watch',
        description: '',
        price: 5000,
        imagePath: 'lib/assets/blacksmartwatch.jpg'
    )
  ];
  //users Cart
  List<Product> _cart = [];

  //get products
  List<Product> get shop => _shop;
  // get user cart
  List<Product> get cart => _cart;

  //add in cart
  void addToCart(Product product){
    _cart.add(product);
    notifyListeners();
  }

  //remove from cart
  void removeFromCart(Product product){
    _cart.remove(product);
    notifyListeners();
  }
}