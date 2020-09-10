import 'package:flutter/material.dart';
import 'package:onlineshopping/constants.dart';

class CartCounter extends StatefulWidget {
  final Size size;
  CartCounter({Key key, this.size}) : super(key: key);

  @override
  _CartCounterState createState() => _CartCounterState();
}

class _CartCounterState extends State<CartCounter> {
  int count = 1;
  bool isFavourite = false;

  _toggleFavourite() {
    setState(() {
      isFavourite = !isFavourite;
    });
  }

  String _getCount() {
    if (count > 10) {
      return count.toString();
    }
    return "0${count.toString()}";
  }

  _updateCounter({add: true}) {
    if (add) {
      setState(() {
        count += 1;
      });
      return;
    }
    if (count > 0) {
      setState(() {
        count -= 1;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 50, bottom: 50),
        padding: EdgeInsets.only(right: kDefaultPaddin),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [counter(), favourite()],
        ));
  }

  IconButton favourite() {
    return IconButton(
        icon: Icon(
          isFavourite ? Icons.favorite_rounded : Icons.favorite_outline_rounded,
          color: Colors.red.shade500,
        ),
        iconSize: 50,
        onPressed: () => {_toggleFavourite()});
  }

  Row counter() {
    return Row(
      children: [
        IconButton(
            icon: Icon(Icons.remove_circle_outline),
            iconSize: 40,
            onPressed: () => {_updateCounter(add: false)}),
        Text(
          _getCount(),
          style: TextStyle(fontSize: 24),
        ),
        IconButton(
            icon: Icon(Icons.add_circle_outline),
            iconSize: 40,
            onPressed: () => {_updateCounter()})
      ],
    );
  }
}
