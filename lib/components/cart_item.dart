import 'package:flutter/material.dart';
import 'package:notes_app/models/cart.dart';
import 'package:notes_app/models/shoe.dart';
import 'package:provider/provider.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key, required this.shoe});
  final Shoe shoe;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.white,
      ),
      child: ListTile(
        leading: Image.asset('images/${shoe.imagepath}'),
        title: Text(shoe.shoename),
        subtitle: Text('${shoe.price} USD'),
        trailing: IconButton(
            onPressed: () {
              Provider.of<Cart>(context, listen: false)
                  .removeItemFromCart(shoe);
            },
            icon: const Icon(Icons.delete)),
      ),
    );
  }
}
