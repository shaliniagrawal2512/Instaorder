import 'package:flutter/material.dart';

class CategoryBox1 extends StatelessWidget {
  Widget myImage(String imageUrl, String label) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Column(
        children: [
          Image(
            image: AssetImage(imageUrl),
            height: 120,
          ),
          SizedBox(height: 5),
          Text(label),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[850],
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        children: [
          myImage('images/tasty.jpg', 'korma'),
          myImage('images/tasty2.jpg', 'Burger'),
          myImage('images/tasty3.jpg', 'pizza'),
          myImage('images/tasty4.jpg', 'manchurian'),
          myImage('images/tasty48.jpg', 'momos'),
          myImage('images/tastymaster.png', 'hakka noodles'),
        ],
      ),
    );
  }
}
