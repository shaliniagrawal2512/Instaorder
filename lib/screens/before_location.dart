import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/constants.dart';
import 'package:untitled/components/raised_buttons.dart';
import 'homeScreen.dart';

class BefLocScreen extends StatelessWidget {
  BefLocScreen({required this.name});
  final String name;
  static const String id = 'befloc_screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        padding: EdgeInsets.all(30),
        decoration: BoxDecoration(
            image: DecorationImage(
          colorFilter: ColorFilter.srgbToLinearGamma(),
          alignment: Alignment.topCenter,
          image: AssetImage('images/tasty48.jpg'),
          //fit: BoxFit?,
        )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Hi $name !! Welcome to InstaOrder',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 80, top: 20, bottom: 40),
              child: Text(
                'Please turn on your GPS or add your location manually to find out restaurant suggestions near you.',
                style: TextStyle(fontWeight: FontWeight.w300),
              ),
            ),
            RaisedGradientButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return HomeScreen(
                    name: name,
                  );
                }));
              },
              label: 'Turn on GPS',
              color: [kButtonColor1, kButtonColor2],
              // icon: Icons.login,
            ),
            RaisedGradientButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return HomeScreen(
                    name: name,
                  );
                }));
              },
              label: 'Add location manually',
              // icon: Icons.account_circle,
              // border: BorderSide(color: kButtonColor1),
              color: [kButtonColor1, kButtonColor2],
            )
          ],
        ),
      ),
    );
  }
}
