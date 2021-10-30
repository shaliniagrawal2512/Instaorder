import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  ReusableCard({required this.onPress});
  final Function onPress;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onPress as void Function()?,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Card(
              color: Color(0xff303030),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              elevation: 5.0,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Stack(children: <Widget>[
                      Container(
                        height: MediaQuery.of(context).size.height / 4.5,
                        width: MediaQuery.of(context).size.height / 3.5,
                        decoration: BoxDecoration(
                            color: Colors.blueGrey,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(15),
                                topRight: Radius.circular(15)),
                            image: DecorationImage(
                              image: AssetImage('images/tasty.jpg'),
                              fit: BoxFit.fill,
                            )),
                      ),
                      Container(
                        margin: EdgeInsets.all(8),
                        padding: EdgeInsets.all(3),
                        width: 60,
                        height: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Color(0xff303030),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.yellow,
                            ),
                            Text(
                              ' 4.5',
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        ),
                      )
                    ]),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, top: 10),
                      child: Text('Roll\'s hub',
                          style: TextStyle(
                              fontSize: 25,
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text('121 vivekanand colony agar',
                          style: TextStyle(fontSize: 15, color: Colors.white)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text('distance: 60 m',
                          style: TextStyle(fontSize: 10, color: Colors.white)),
                    ),
                  ])),
        ));
  }
}
