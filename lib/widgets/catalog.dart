import 'package:basic_flutter/models/cart.dart';
import 'package:basic_flutter/pages/item_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CatalogListTile extends StatelessWidget {
  final imgUrl;

  const CatalogListTile({Key? key, this.imgUrl}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final cartData = Provider.of<CartDataProvider>(context);
    final cartItems = cartData.cartItems;

    return InkWell(
      onTap: () {
        // go to catalog
      },
      child: Container(
        padding: const EdgeInsets.all(10.0),
        child: ListTile(
          leading: Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              image: DecorationImage(
                image: NetworkImage(imgUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          title: const Text('Summer fresh'),
          subtitle: Column(
            children: [
              const Text('09:00 - 00:00'),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.star,
                    size: 15,
                    color: Colors.amberAccent,
                  ),
                  const Text("4.9"),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
