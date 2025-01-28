import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/drink_tile.dart';
import '../models/cart.dart';
import '../models/drink.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {

  //add drink to cart
  void addDrinkToCart(Drink drink) {
    Provider.of<Cart> (context, listen: false).addItemToCart(drink);

    //alert the user 
    showDialog(context: context, builder: (context) => AlertDialog(
      title: Text("Succesfully added!!"),
      content: Text("Check your cart"),
    ));
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(builder: (context, value, child) => Column(
      children: [
        //search bar
        Container(
          padding: EdgeInsets.all(12),
          margin: const EdgeInsets.symmetric(horizontal: 25),
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(15),
          ),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Search",
                style: TextStyle(color: Colors.grey),
              ),
              Icon(
                Icons.search,
                color: Colors.grey,
              )
            ],
          ),
        ),

        //message

        Padding(
          padding: const EdgeInsets.symmetric(vertical: 25.0),
          child: Text(
            "a different kind of company. a different kind of dog collar.",
            style: TextStyle(color: Colors.grey[600]),
          ),
        ),
        //hot picks
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "Hot Pick 🔥",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
              Text(
                "See All",
                style:
                TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Expanded(
          child: ListView.builder(
            itemCount: 4,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              Drink drink = value.getDrinkList() [index];
              return DrinkTile(drink: drink, onTap:() => addDrinkToCart(drink),);
            },
          ),
        ),
        Padding(
            padding: const EdgeInsets.only(left:25, top: 25, right:25),
            child: Divider( color: Colors.white,)
        ),
      ],
    ),);
  }
}
