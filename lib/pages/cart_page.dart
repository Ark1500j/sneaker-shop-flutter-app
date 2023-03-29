import 'package:flutter/material.dart';
import 'package:notes_app/components/cart_item.dart';
import 'package:notes_app/models/cart.dart';
import 'package:notes_app/models/shoe.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, value, child) => Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'My Cart',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: value.getUserCart().length,
                itemBuilder: (BuildContext context, int index) {
                  Shoe shoe = value.getUserCart()[index];
                  return CartItem(shoe: shoe);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
