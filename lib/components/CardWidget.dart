import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  ReusableCard(
      {required this.colour, required this.cardchild, required this.onPress});
  final Color colour;
  final Widget cardchild;
  final Function onPress;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onPress as void Function()?,
        child: Container(
          padding: EdgeInsets.all(30),
          decoration: BoxDecoration(
              color: colour,
              borderRadius: BorderRadius.circular(20.0),
              image: DecorationImage(
                image: AssetImage('images/tasty48.jpg'),
                //fit: BoxFit?,
              )),
          child: cardchild,
          margin: EdgeInsets.all(50.0),
        ));
  }
}
