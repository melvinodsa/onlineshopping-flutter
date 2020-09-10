import 'package:flutter/material.dart';
import 'package:onlineshopping/constants.dart';
import 'package:onlineshopping/models/Product.dart';

import 'product_title_with_image.dart';
import 'description.dart';

class Body extends StatelessWidget {
  final Product product;

  const Body({Key key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: size.height,
            child: Stack(
              children: [
                Description(product: product, size: size),
                ProductTitleWithImage(product: product, size: size)
              ],
            ),
          )
        ],
      ),
    );
  }

  Container detailsBody(BuildContext context, Size size) {
    return Container(
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
          )
        ],
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
