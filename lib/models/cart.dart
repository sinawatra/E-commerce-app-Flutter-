import 'package:ecommerce_app/models/drink.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Cart extends ChangeNotifier {
  // List of drinks for sale
  List<Drink> drinkShop = [
    Drink(
      name: "Lemonade",
      price: "10",
      imagePath: "lib/images/Bluerasberry.png",
      description: "From Logan",
    ),
    Drink(
      name: "Lemonade",
      price: "10",
      imagePath: "lib/images/lemondae.png",
      description: "From Logan",
    ),
    Drink(
      name: "Lemonade",
      price: "10",
      imagePath: "lib/images/kyrie.png",
      description: "From Logan",
    ),
    Drink(
      name: "Lemonade",
      price: "10",
      imagePath: "lib/images/lemondae.png",
      description: "From Logan",
    ),
  ];

  // List of items in user cart
  List<Drink> userCart = [];

  // Get list of drinks for sale
  List<Drink> getDrinkList() {
    return drinkShop;
  }

  // Get cart
  List<Drink> getUserCart() {
    return userCart;
  }

  // Add items to the cart
  void addItemToCart(Drink drink) {
    userCart.add(drink);
    notifyListeners(); // Notify listeners after modifying the cart
  }

  // Remove item from cart
  void removeItemFromCart(Drink drink) {
    userCart.remove(drink);
    notifyListeners(); // Notify listeners after modifying the cart
  }
}