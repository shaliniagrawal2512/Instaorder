import 'package:flutter/material.dart';
import 'package:untitled/screens/homeScreen.dart';
import 'package:untitled/screens/menuScreen.dart';
import 'screens/topScreen.dart';
import 'screens/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var phoneNumber = prefs.getString('phoneNumber');
  var address = prefs.getString('address');
  var name = prefs.getString('name');
  Widget getRoute() {
    if (phoneNumber == null && address == null && name == null) {
      return MyApp();
    } else if (address == null) {
      return HomeScreen(name: name.toString());
    } else {
      return MenuScreen(address: address.toString(), name: name.toString());
    }
  }

  runApp(MaterialApp(home: getRoute()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'InstaOrder',
        theme: ThemeData.dark(),
        debugShowCheckedModeBanner: false,
        initialRoute: TopScreen.id,
        routes: {
          TopScreen.id: (context) => TopScreen(),
          LoginScreen.id: (context) => LoginScreen(),
        });
  }
}
