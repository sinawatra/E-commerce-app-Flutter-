import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/cart_item.dart';
import '../models/cart.dart'; // Ensure this import is correct
import '../models/drink.dart'; // Ensure this import is correct

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>( // Specify the type here (Cart)
      builder: (context, value, child) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "My Cart",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            const SizedBox(height: 25),
            Expanded(
              child: Container(
                child: ListView.builder(
                  itemCount: value.getUserCart().length, // Add itemCount
                  itemBuilder: (context, index) {
                    // Get individual drink
                    Drink individualDrink = value.getUserCart()[index];
                    // Return the cart item
                    return CartItem(drink: individualDrink);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}