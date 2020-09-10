import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:onlineshopping/constants.dart';
import 'package:onlineshopping/models/Product.dart';
import 'package:onlineshopping/screens/details/details.dart';

import 'category.dart';
import 'item-card.dart';

class Body extends StatelessWidget {
  final List<Product> products;

  Body({Key key, this.products}) : super(key: key);

  @override
  Widget build(Object context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
          child: Text(
            "Women",
            style: Theme.of(context)
                .textTheme
                .headline5
                .copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        Categories(),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
          child: GridView.builder(
              itemCount: this.products.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: kDefaultPaddin,
                  crossAxisSpacing: kDefaultPaddin,
                  childAspectRatio: 0.75),
              itemBuilder: (context, index) => ItemCard(
                    product: this.products[index],
                    onPress: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                DetailsScreen(product: this.products[index]))),
                  )),
        ))
      ],
    );
  }
}
