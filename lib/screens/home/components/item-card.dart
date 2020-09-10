import 'package:flutter/material.dart';
import 'package:onlineshopping/constants.dart';
import 'package:onlineshopping/models/Product.dart';

class ItemCard extends StatelessWidget {
  final Product product;
  final Function onPress;
  const ItemCard({
    Key key,
    this.product,
    this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(kDefaultPaddin),
              height: 250,
              decoration: BoxDecoration(
                color: this.product.color,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Image.asset(this.product.image),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin / 4),
            child: Text(
              this.product.title,
              style: TextStyle(color: kTextLightColor),
            ),
          ),
          Text("₹ ${this.product.price}",
              style: TextStyle(fontWeight: FontWeight.bold))
        ],
      ),
    );
  }
}
