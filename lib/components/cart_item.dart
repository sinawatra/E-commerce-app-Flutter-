import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/cart.dart'; // Ensure this import is correct
import '../models/drink.dart'; // Ensure this import is correct

class CartItem extends StatefulWidget {
  final Drink drink;
  const CartItem({super.key, required this.drink});

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  // Remove item from cart
  void removeItemFromCart() {
    Provider.of<Cart>(context, listen: false).removeItemFromCart(widget.drink);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        leading: Image.asset(widget.drink.imagePath),
        title: Text(widget.drink.name),
        subtitle: Text(widget.drink.price),
        trailing: IconButton(
          onPressed: removeItemFromCart, // Call the correct method here
          icon: const Icon(Icons.delete),
        ),
      ),
    );
  }
}