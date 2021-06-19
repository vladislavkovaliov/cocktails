import 'package:basic_flutter/models/cart.dart';
import 'package:basic_flutter/widgets/cart_item_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cartData = Provider.of<CartDataProvider>(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text("Basket"),
        ),
        body: cartData.cartItems.isEmpty
            ? Card(
                elevation: 5.0,
                margin: const EdgeInsets.all(30.0),
                child: Container(
                  width: double.infinity,
                  height: 100,
                  alignment: Alignment.center,
                  child: const Text(
                    "No product",
                  ),
                ),
              )
            : Column(
                children: [
                  const Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("Price: " + cartData.totalAmount.toStringAsFixed(2),
                          style: const TextStyle(fontSize: 20.0)),
                      MaterialButton(
                        onPressed: () {
                          cartData.clear();
                        },
                        color: Theme.of(context).primaryColor,
                        child: Text("Buy"),
                      ),
                    ],
                  ),
                  const Divider(),
                  Expanded(
                    child: CartItemList(cartData: cartData),
                  )
                ],
              ));
  }
}
