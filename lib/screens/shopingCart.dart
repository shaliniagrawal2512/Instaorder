import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/screens/paymentmethods.dart';

class CartScreen extends StatelessWidget {
  static const String id = 'cart_screen';
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text('Your Cart'),
          backgroundColor: Colors.grey[850],
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Column(
            children: [
              Expanded(
                child: Container(
                  //height: 300,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: CategoryBox(),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                color: Colors.grey[850],
                height: 70,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total Payment : ',
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        'Rs. 620',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 50,
                color: Colors.grey[850],
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return MakePayment();
                      },
                    ));
                  },
                  child: Center(
                      child: Text(
                    'Place Order',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CategoryBox extends StatelessWidget {
  Widget myImage(String imageUrl, String label, String price) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Card(
        color: Colors.grey[850],
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Image(
                    image: AssetImage(imageUrl),
                    height: 120,
                  ),
                  //SizedBox(height: 5),
                ],
              ),
              Column(
                children: [
                  Text(
                    label,
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    price,
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          myImage('images/tasty.jpg', 'panner tikka', '90'),
          SizedBox(
            height: 2,
          ),
          myImage('images/tasty48.jpg', 'pizza', '120'),
          SizedBox(
            height: 2,
          ),
          myImage('images/tastymaster.png', 'spring roles', '110'),
          SizedBox(
            height: 2,
          ),
          myImage('images/tasty2.jpg', 'Burger', '50'),
          SizedBox(
            height: 2,
          ),
          myImage('images/tasty3.jpg', 'shahi korma', '160'),
          SizedBox(
            height: 2,
          ),
          myImage('images/tasty5.jpg', 'crisp masala', '180'),
          SizedBox(
            height: 2,
          ),
        ],
      ),
    );
  }
}
