import 'package:basic_flutter/models/product.dart';
import 'package:basic_flutter/widgets/bottom_bar.dart';
import 'package:basic_flutter/widgets/catalog.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/item_card.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<ProductDataProvider>(context);

    return Scaffold(
      backgroundColor: Colors.amberAccent,
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height - 85,
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(35),
                bottomRight: Radius.circular(35),
              )),
          child: ListView(
            padding: const EdgeInsets.all(10.0),
            children: <Widget>[
              const ListTile(
                title: Text(
                  "Fresh Drinks",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  "More than  100 sorts of cocktails",
                  style: TextStyle(fontSize: 16),
                ),
                trailing: Icon(Icons.panorama_horizontal),
              ),
              Container(
                height: 300,
                padding: const EdgeInsets.all(5.0),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: productData.items.length,
                  itemBuilder: (context, int index) =>
                    ChangeNotifierProvider.value(
                      value: productData.items[index],
                      child: ItemCard(),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  "Catalog cocktails",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),

              ...productData.items.map((value) {
                return CatalogListTile(imgUrl: value.imgUrl);
              }).toList(),
            ],
          ),
        ),
      ),
      // Bottom  Bar
      bottomNavigationBar: const BottomBar(),
    );
  }
}
