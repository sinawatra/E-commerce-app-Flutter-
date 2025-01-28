import 'package:flutter/material.dart';
import 'package:ecommerce_app/models/drink.dart';

class DrinkTile extends StatelessWidget {
  Drink drink;
  void Function()? onTap;
  DrinkTile({super.key, required this.drink, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 25),
      width: 280,
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //drink pic
          ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(drink.imagePath))

          //description
          ,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Text(
              drink.description,
              style: TextStyle(
                color: Colors.grey[600],
              ),
            ),
          ),

          //price + detail
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //drink name
                  Text(
                    drink.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  // price
                  Text('\$' + drink.price, style: TextStyle(color: Colors.grey),),
                ],
              )
              //cart button
              ,
              GestureDetector(
                onTap: onTap,
                child: Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10)),
                  ),
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          )

          //button to add-to-cart
        ],
      ),
    );
  }
}
