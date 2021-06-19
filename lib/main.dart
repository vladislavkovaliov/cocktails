import 'package:basic_flutter/models/cart.dart';
import 'package:basic_flutter/models/product.dart';
import 'package:basic_flutter/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ProductDataProvider>(create: (context) => ProductDataProvider()),
        ChangeNotifierProvider<CartDataProvider>(create: (context) => CartDataProvider()),
      ],
      child: MaterialApp(
        title: "Demo App",
        theme: ThemeData(
          primarySwatch: Colors.amber,
          backgroundColor: Colors.white,
          textTheme: GoogleFonts.marmeladTextTheme(
            Theme.of(context).textTheme,
          ),
        ),
        home: HomePage(),
      ),
    );
  }
}
