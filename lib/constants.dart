import 'package:flutter/material.dart';

Color kButtonColor1 = Color(0xff1DA283);
Color kButtonColor2 = Color(0xff4AD99F);

const kHeaderTextStyle =
    TextStyle(fontSize: 50.0, color: Colors.white, fontWeight: FontWeight.bold);

const kInputDecorationStyle = InputDecoration(
  prefixIcon: IconTheme(
    data: IconThemeData(color: Colors.white),
    child: Icon(Icons.add),
  ),
  hintText: 'Enter a value.',
  hintStyle: TextStyle(),
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(18.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.white, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(18.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.white, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(18.0)),
  ),
);
