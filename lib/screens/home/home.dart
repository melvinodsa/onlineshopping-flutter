import 'package:flutter/material.dart';
import 'package:onlineshopping/constants.dart';
import 'package:onlineshopping/models/Product.dart';
import 'package:onlineshopping/services/product.dart';

import 'components/body.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  List<Product> products = new List<Product>();

  @override
  void initState() {
    super.initState();
    loadProducts();
  }

  void loadProducts() async {
    var productService = new ProductService();
    var products = await productService.getProducts();

    setState(() {
      this.products = products;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Body(products: this.products),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back,
          color: kTextColor,
        ),
        onPressed: () {},
      ),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.search, color: kTextColor),
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(Icons.shopping_basket, color: kTextColor),
          onPressed: () {},
        ),
        SizedBox(width: kDefaultPaddin / 2)
      ],
    );
  }
}
