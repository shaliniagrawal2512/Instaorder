import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Restaurant extends StatelessWidget {
  Widget restaurant(
      String imageUrl, String name, String distance, int ratings) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Column(
        children: [
          Image(
            image: AssetImage(imageUrl),
            height: 200,
          ),
          Text(name),
          Text(distance),
          RatingBar.builder(
            itemSize: 20,
            initialRating: 3,
            minRating: 1,
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemCount: 5,
            itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
            itemBuilder: (context, _) => Icon(
              Icons.star,
              color: Colors.amber,
            ),
            onRatingUpdate: (rating) {
              print(rating);
            },
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        right: 5,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.grey[850],
      ),
      child: Row(
        children: [
          restaurant('images/tasty.jpg', 'name', 'distance', 3),
          restaurant('images/tasty2.jpg', 'name', 'distance', 1),
          restaurant('images/tasty3.jpg', 'name', 'distance', 4),
          restaurant('images/tasty4.jpg', 'name', 'distance', 5),
          restaurant('images/tasty48.jpg', 'name', 'distance', 2),
        ],
      ),
    );
  }
}
