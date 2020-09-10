import 'package:flutter/material.dart';
import 'package:onlineshopping/constants.dart';
import 'package:onlineshopping/models/Product.dart';

import 'cart_counter.dart';

class Description extends StatelessWidget {
  final Product product;
  final Size size;
  const Description({Key key, this.product, this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: size.height * 0.3),
      padding: EdgeInsets.only(top: size.height * 0.1),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24), topRight: Radius.circular(24)),
      ),
      child: Container(
        child: Container(
          margin: EdgeInsets.only(left: kDefaultPaddin, right: kDefaultPaddin),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildColorOptions(context, size),
                  buildSizeInfo(context),
                ],
              ),
              Text(
                product.description,
                style: TextStyle(height: 1.5),
              ),
              CartCounter(size: size),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                      icon: Icon(Icons.shopping_cart_outlined,
                          color: product.color),
                      iconSize: 80,
                      onPressed: null),
                  SizedBox(
                    height: 80,
                    width: size.width * 0.5,
                    child: FlatButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        color: product.color,
                        onPressed: () {},
                        child: Text("Buy Now".toUpperCase(),
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.white))),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Column buildSizeInfo(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(children: [
            TextSpan(text: "Size"),
          ], style: Theme.of(context).textTheme.subtitle1.copyWith(height: 2)),
        ),
        RichText(
          text: TextSpan(
              children: [
                TextSpan(text: product.size.toString()),
                TextSpan(text: " cm")
              ],
              style: Theme.of(context)
                  .textTheme
                  .subtitle1
                  .copyWith(fontSize: 24, height: 1, color: Colors.black)),
        )
      ],
    );
  }

  Container buildColorOptions(BuildContext context, Size size) {
    return Container(
      width: size.width * 0.5,
      height: size.height * 0.1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: TextSpan(
                children: [
                  TextSpan(text: "Color"),
                ],
                style:
                    Theme.of(context).textTheme.subtitle1.copyWith(height: 2)),
          ),
          Row(
            children: [
              colorDot(product.color, isSelected: true),
              colorDot(Color(0xFFF8C078)),
              colorDot(Color(0xFFA29B9B)),
            ],
          )
        ],
      ),
    );
  }

  Container colorDot(Color color, {bool isSelected: false}) {
    return Container(
      height: 24,
      width: 24,
      margin: EdgeInsets.all(2),
      padding: EdgeInsets.all(2),
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: isSelected ? Border.all(color: color) : null),
      child: DecoratedBox(
        decoration: BoxDecoration(shape: BoxShape.circle, color: color),
      ),
    );
  }
}
