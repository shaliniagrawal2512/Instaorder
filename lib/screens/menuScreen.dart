import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/screens/shopingCart.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/screens/topScreen.dart';
import 'package:untitled/components/CardWidget.dart';

class MenuScreen extends StatefulWidget {
  static const String id = 'Menu_screen';
  MenuScreen({required this.address, required this.name});
  final String address;
  final String name;
  @override
  State<MenuScreen> createState() =>
      _MenuScreenState(address: address, name: name);
}

class _MenuScreenState extends State<MenuScreen> {
  _MenuScreenState({required this.name, required this.address});
  final String address;
  final String name;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return CartScreen();
            }));
          },
          icon: Icon(
            Icons.shopping_cart_rounded,
            size: 30,
          ),
        ),
        backgroundColor: Colors.grey[850],
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hi $name',
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 20,
                  ),
                ),
                Text('$address'),
              ],
            ),
            IconButton(onPressed: () {}, icon: Icon(Icons.search))
          ],
        ),
      ),
      body: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
          padding: const EdgeInsets.only(left: 10.0, top: 10),
          child: Text(
            'Trending Restaurants',
            style: TextStyle(
                fontSize: 35, color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          height: 300,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              return ReusableCard(onPress: () {});
            },
            itemCount: 6,
          ),
        ),
        Container(
          height: 300,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              return ReusableCard(onPress: () {});
            },
            itemCount: 6,
          ),
        )
      ])),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.remove('phoneNumber');
          prefs.remove('name');
          prefs.remove('address');
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return TopScreen();
          }));
        },
      ),
    );
  }
}
