import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/constants.dart';
import 'package:untitled/components/raised_buttons.dart';
import 'registration_screen.dart';
import 'login_screen.dart';

class TopScreen extends StatelessWidget {
  static const String id = 'top_screen';
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
              'Get served as an emperor, the food of your choice.',
              style: TextStyle(
                color: Colors.white,
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 80, top: 20, bottom: 40),
              child: Text(
                'Time is precious we know that get all types of food at your doorstep delivered in 30 min...',
                style:
                    TextStyle(fontWeight: FontWeight.w300, color: Colors.white),
              ),
            ),
            RaisedGradientButton(
              onPressed: () {
                Navigator.pushNamed(context, LoginScreen.id);
              },
              label: 'Log in',
              color: [kButtonColor1, kButtonColor2],
              icon: Icons.login,
            ),
            RaisedGradientButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return MyLogin();
                }));
              },
              label: 'Sign up',
              icon: Icons.account_circle,
              border: BorderSide(color: kButtonColor1),
              color: [Colors.black, Colors.black],
            )
          ],
        ),
      ),
    );
  }
}
