import 'package:flutter/material.dart';
import 'package:onlineshopping/constants.dart';
import 'package:onlineshopping/models/Product.dart';

class ProductTitleWithImage extends StatelessWidget {
  const ProductTitleWithImage({
    Key key,
    @required this.size,
    @required this.product,
  }) : super(key: key);

  final Size size;
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
      child: Container(
        height: size.height * 0.35,
        width: size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [buildTitle(context), buildPriceAndItem(context)],
        ),
      ),
    );
  }

  Container buildPriceAndItem(BuildContext context) {
    return Container(
      height: size.height * 0.25,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [buildPrice(context), buildImage()],
      ),
    );
  }

  Container buildImage() {
    return Container(
      height: size.height * 0.25,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Image.asset(
            product.image,
            width: size.width * 0.4,
          ),
        ],
      ),
    );
  }

  Container buildPrice(BuildContext context) {
    return Container(
      height: size.height * 0.25,
      width: size.width * 0.3,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
                text: TextSpan(children: [
              TextSpan(
                  text: "Price\n",
                  style: Theme.of(context)
                      .textTheme
                      .caption
                      .copyWith(color: Colors.white)),
              TextSpan(
                  text: "₹ ${product.price}",
                  style: Theme.of(context)
                      .textTheme
                      .headline4
                      .copyWith(color: Colors.white))
            ])),
          ]),
    );
  }

  Column buildTitle(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Aristocratic Hand Bag",
          style:
              Theme.of(context).textTheme.caption.copyWith(color: Colors.white),
        ),
        Text(
          product.title,
          style: Theme.of(context)
              .textTheme
              .headline4
              .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
