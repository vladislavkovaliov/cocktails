import 'package:basic_flutter/models/cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartItem extends StatelessWidget {
  final cartData;
  final index;

  CartItem({Key? key, this.cartData, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        leading: InkWell(
          onTap: () {
            // go to details
          },
          child: Container(
              width: 50,
              height: 50,
              margin: const EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                    image: NetworkImage(
                        cartData.cartItems.values.toList()[index].imgUrl),
                    fit: BoxFit.cover,
                  ))),
        ),
        title: Text(cartData.cartItems.values.toList()[index].title),
        subtitle:
            Text('Price: ${cartData.cartItems.values.toList()[index].price}'),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const Icon(Icons.remove_circle_outline),
              onPressed: () {
                Provider.of<CartDataProvider>(context, listen: false)
                    .updateItemsRemoveOne(
                        cartData.cartItems.keys.toList()[index]);
              },
            ),
            Text('x${cartData.cartItems.values.toList()[index].number}'),
            IconButton(
              icon: const Icon(Icons.add_circle_outline),
              onPressed: () {
                Provider.of<CartDataProvider>(context, listen: false)
                    .updateItemsAddOne(cartData.cartItems.keys.toList()[index]);
              },
            ),
          ],
        ),
      ),
    );
  }
}
