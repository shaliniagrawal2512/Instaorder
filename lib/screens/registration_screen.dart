import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:untitled/screens/before_location.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:untitled/constants.dart';
import 'package:untitled/components/raised_buttons.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum MyLoginScreen { SHOW_MOBILE_ENTER_WIDGET, SHOW_OTP_FORM_WIDGET }

class MyLogin extends StatefulWidget {
  @override
  _MyLoginState createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {
  TextEditingController phoneController = TextEditingController();
  TextEditingController otpController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  MyLoginScreen currentState = MyLoginScreen.SHOW_MOBILE_ENTER_WIDGET;
  FirebaseAuth _auth = FirebaseAuth.instance;
  String verificationID = "";

  void SignOutME() async {
    await _auth.signOut();
  }

  void signInWithPhoneAuthCred(AuthCredential phoneAuthCredential) async {
    try {
      final authCred = await _auth.signInWithCredential(phoneAuthCredential);

      if (authCred.user != null) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('phoneNumber', phoneController.text);
        prefs.setString('name', usernameController.text);
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return BefLocScreen(
            name: usernameController.text,
          );
        }));
      }
    } on FirebaseAuthException catch (e) {
      print(e.message);
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Some Error Occurred. Try Again Later')));
    }
  }

  showMobilePhoneWidget(context) {
    return Container(
        padding: EdgeInsets.all(30),
        decoration: BoxDecoration(
            image: DecorationImage(
          colorFilter: ColorFilter.srgbToLinearGamma(),
          alignment: Alignment.topCenter,
          image: AssetImage('images/tasty2.jpg'),
          //fit: BoxFit?,
        )),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'Sign up',
                style: kHeaderTextStyle,
              ),
              SizedBox(height: 20.0),
              TextField(
                controller: usernameController,
                keyboardType: TextInputType.number,
                decoration: kInputDecorationStyle.copyWith(
                    hintText: 'Enter Username',
                    prefixIcon: Icon(
                      Icons.account_circle,
                      color: Colors.white,
                    )),
              ),
              SizedBox(height: 20.0),
              Container(
                padding: EdgeInsets.all(8),
                height: 50,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.all(Radius.circular(18))),
                child: IntlPhoneField(
                  controller: phoneController,
                  keyboardType: TextInputType.number,
                  showDropdownIcon: false,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.zero,
                    hintText: 'Enter phone number',
                    border: InputBorder.none,
                  ),
                  initialCountryCode: 'IN',
                ),
              ),
              SizedBox(
                height: 20,
              ),
              RaisedGradientButton(
                color: [
                  Color(0xFF1DA283),
                  Color(0xFF4AD99F),
                ],
                label: 'Generate OTP',
                icon: Icons.check_box,
                onPressed: () async {
                  await _auth.verifyPhoneNumber(
                      phoneNumber: "+91${phoneController.text}",
                      verificationCompleted: (phoneAuthCredential) async {},
                      verificationFailed: (verificationFailed) {
                        print(verificationFailed);
                      },
                      codeSent: (verificationID, resendingToken) async {
                        setState(() {
                          currentState = MyLoginScreen.SHOW_OTP_FORM_WIDGET;
                          this.verificationID = verificationID;
                        });
                      },
                      codeAutoRetrievalTimeout: (verificationID) async {});
                },
              )
            ]));
  }

  showOtpFormWidget(context) {
    return Container(
        padding: EdgeInsets.only(bottom: 80, left: 30, right: 30),
        decoration: BoxDecoration(
            image: DecorationImage(
          colorFilter: ColorFilter.srgbToLinearGamma(),
          alignment: Alignment.topCenter,
          image: AssetImage('images/tastymaster.png'),
        )),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              "Enter OTP send to given number",
              style: TextStyle(fontSize: 30),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: otpController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18)),
                  hintText: "Enter Your OTP"),
            ),
            SizedBox(
              height: 10,
            ),
            RaisedGradientButton(
                icon: Icons.check_box,
                color: [Color(0xFF1DA283), Color(0xFF4AD99F)],
                label: 'Verify',
                onPressed: () {
                  AuthCredential phoneAuthCredential =
                      PhoneAuthProvider.credential(
                          verificationId: verificationID,
                          smsCode: otpController.text);
                  signInWithPhoneAuthCred(phoneAuthCredential);
                })
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: currentState == MyLoginScreen.SHOW_MOBILE_ENTER_WIDGET
          ? showMobilePhoneWidget(context)
          : showOtpFormWidget(context),
    );
  }
}
