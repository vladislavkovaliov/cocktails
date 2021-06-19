import 'package:basic_flutter/models/product.dart';
import 'package:basic_flutter/models/cart.dart';
import 'package:basic_flutter/pages/cart_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ItemPage extends StatelessWidget {
  final String productId;

  const ItemPage({Key? key, required this.productId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final data =
        Provider.of<ProductDataProvider>(context).getElementById(productId);
    return Scaffold(
      appBar: AppBar(
        title: Text(data.title, style: GoogleFonts.marmelad()),
      ),
      body: Container(
        child: ListView(children: [
          Hero(
            tag: data.imgUrl,
            child: Container(
              height: 300,
              width: double.infinity,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(data.imgUrl), fit: BoxFit.cover)),
            ),
          ),
          Card(
            elevation: 5.0,
            margin:
                const EdgeInsets.symmetric(horizontal: 35.0, vertical: 10.0),
            child: Container(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  children: [
                    Text(data.title, style: TextStyle(fontSize: 26)),
                    const Divider(),
                    Row(
                      children: [
                        const Text(
                          "Price: ",
                          style: TextStyle(fontSize: 24),
                        ),
                        Text(
                          '${data.price}',
                          style: TextStyle(fontSize: 24),
                        ),
                      ],
                    ),
                    const Divider(),
                    Text(data.description),
                    const SizedBox(height: 20.0),
                    Provider.of<CartDataProvider>(context)
                            .cartItems
                            .containsKey(data.id)
                        ? Column(children: [
                            MaterialButton(
                                color: const Color(0xFFCCFF90),
                                child: const Text("Go Basket"),
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => CartPage()));
                                }),
                            const Text("Product is already in basket.",
                                style: TextStyle(
                                    fontSize: 12.0, color: Colors.blueGrey)),
                          ])
                        : MaterialButton(
                            color: const Color(0xFFCCFF90),
                            child: const Text("Add to basket"),
                            onPressed: () {
                              Provider.of<CartDataProvider>(context,
                                      listen: false)
                                  .addItem(
                                      productId: data.id,
                                      price: data.price,
                                      title: data.title,
                                      imgUrl: data.imgUrl);
                            }),
                  ],
                )),
          ),
        ]),
      ),
    );
  }
}
